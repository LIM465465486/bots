select
	ph.AbsEntry						as [W0502],				--OrderNumber
	h.NumAtCard						as [W0503],				--Purchase Order Number 
	'ST'							as [N101],				--Entity Identifier Code 
	case 
		when
			 h.U_SES_RdrType = 'DS'
		then 
			isnull(a.BlockS, h.cardname)
		else  
			case 
				when
					h.shiptocode <> 'ship to'
				then
					isnull(h.ShipToCode,h.CardName)
				else
					h.cardname
			end
	end								as [N102],				--Name 
	a.StreetS						as [N301],				--Address Information 
	a.CityS							as [N401],				--City
	a.StateS						as [N402],				--State
	a.ZipCodeS						as [N403],				--ZipCode
	isnull(a.CountryS,'US')			as [N404],				--Country
	'BT'							as [B-N101],				--Entity Identifier Code 
	isnull(h.PayToCode,h.CardName)	as [B-N102],				--Name 
	a.StreetB						as [B-N301],				--Address Information 
	a.CityB							as [B-N401],				--City
	a.StateB						as [B-N402],				--State
	a.ZipCodeB						as [B-N403],				--ZipCode
	a.CountryB						as [B-N404],				--Country
	case 
		when isnull(h.U_ALL_REF_IT,'') <> ''
		then 'ST' 
	end								as [N901],					
	h.U_ALL_REF_IT					as [N902],					
	'10'							as [G6201],
	h.DocDueDate					as [G6202],
	'04'							as [G6201],
	h.DocDate						as [G6202],
	'02'							as [G6201],
	h.DocDueDate					as [G6202],
	'01'							as [G6201],
	h.CancelDate					as [G6202],
	case 
		when isnull(h.U_SES_SLI_GMT,'') <> ''
		then 'GFT'
	end								as [NTE01],
	h.U_SES_SLI_GMT					as [NTE02],
	'???'							as [W6601],					-- need to figure what to put here exactly
	s.U_SES_ShipCode				as [W6610],					--SCAC Code
	pr.PickEntry+1					as [LX01],					--added 1 as row number has to start with 1 in EDI
	pr.RelQtty						as [W0101],					--quantity
	'EA'							as [W0102],
	'VN'							as [W0104],
	i.CodeBars						as [W0105],
	case 
		when isnull(r.U_ALL_CUSTOM_BP_NO,'') <> ''
		then 'BP' 
	end								as [W0106],
	r.U_ALL_CUSTOM_BP_NO			as [W0107],
	i.ItemName						as [G6901],
	case when isnull(r.U_ALL_PackTypeCode,'') <> '' then 'PG' end	as [N901],
	r.U_ALL_PackTypeCode			as [N902],
	case when isnull(r.U_SES_SLI_POP,'') <> '' then 'ZZ' end as [N901],
	r.U_SES_SLI_POP					as [N902],
	'Bring here quantity summary'	as [W7601]
from 
	OPKL ph (nolock)
	inner join
	PKL1 pr (nolock) on ph.AbsEntry = pr.AbsEntry
	inner join
	RDR1 r (nolock) on pr.OrderEntry = r.DocEntry and pr.OrderLine = r.linenum
	inner join
	ORDR h (nolock) on r.DocEntry = h.DocEntry
	inner join
	OITM i (nolock) on r.itemcode = i.itemcode
	left join
	RDR12 a (nolock) on h.DocEntry = a.DocEntry
	left join
	OSHP s (nolock) on h.TrnspCode = s.TrnspCode
where
	ph.Status = 'R'
	--h.U_SES_SLI_GMT is not null
