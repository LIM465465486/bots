#mapping-script
import bots.transform as transform

def main(inn,out):
    #sender, receiver is correct via QUERIES in grammar. 
    out.put({'BOTSID':'ST','ST01':'940','ST02':out.ta_info['reference'].zfill(4)})
    
    out.put({'BOTSID':'ST'},{'BOTSID':'W05','W0501':'N'})
    out.put({'BOTSID':'ST'},{'BOTSID':'W05','W0502':inn.get({'BOTSID':'Document','AbsEntry':None})})
    out.put({'BOTSID':'ST'},{'BOTSID':'W05','W0503':inn.get({'BOTSID':'Document','NumAtCard':None})})
    
    nou = out.putloop({'BOTSID':'ST'},{'BOTSID':'N1'})
    nou.put({'BOTSID':'N1','N101':'ST','N102':inn.get({'BOTSID':'Document','ShipToCode':None})})
    nou.put({'BOTSID':'N1'},{'BOTSID':'N3','N301':inn.get({'BOTSID':'Document','StreetS':None})})
    nou.put({'BOTSID':'N1'},{'BOTSID':'N4','N401':inn.get({'BOTSID':'Document','CityS':None})})
    nou.put({'BOTSID':'N1'},{'BOTSID':'N4','N402':inn.get({'BOTSID':'Document','StateS':None})})
    nou.put({'BOTSID':'N1'},{'BOTSID':'N4','N403':inn.get({'BOTSID':'Document','ZipCodeS':None})})
    nou.put({'BOTSID':'N1'},{'BOTSID':'N4','N404':inn.get({'BOTSID':'Document','CountryS':None})})

    out.put({'BOTSID':'ST'},{'BOTSID':'G62','G6201':'10','G6202':inn.get({'BOTSID':'Document','DocDueDate':None})})
    out.put({'BOTSID':'ST'},{'BOTSID':'G62','G6201':'04','G6202':inn.get({'BOTSID':'Document','DocDate':None})})
    out.put({'BOTSID':'ST'},{'BOTSID':'G62','G6201':'02','G6202':inn.get({'BOTSID':'Document','DocDueDate':None})})
    out.put({'BOTSID':'ST'},{'BOTSID':'G62','G6201':'01','G6202':inn.get({'BOTSID':'Document','CancelDate':None})})

    out.put({'BOTSID':'ST'},{'BOTSID':'NTE','NTE01':inn.get({'BOTSID':'Document','NTE01':None}),'NTE02':inn.get({'BOTSID':'Document','NTE02':None})})

    out.put({'BOTSID':'ST'},{'BOTSID':'W66','W6601':'PP'})
    out.put({'BOTSID':'ST'},{'BOTSID':'W66','W6602':'ZZ'})
    # out.put({'BOTSID':'ST'},{'BOTSID':'W66','W6605':inn.get({'BOTSID':'Document','':None})})
    out.put({'BOTSID':'ST'},{'BOTSID':'W66','W6610':inn.get({'BOTSID':'Document','SCAC':None})})
    
    #loop over lines***************************************
    lin_row = 1
    for lin in inn.getloop({'BOTSID':'Document'},{'BOTSID':'Lines'},{'BOTSID':'Line'}): 
        lou = out.putloop({'BOTSID':'ST'},{'BOTSID':'LX'}) 
        lou.put({'BOTSID':'LX','LX01':str(lin_row)})

        lou.put({'BOTSID':'LX'},{'BOTSID':'W01','W0101':lin.get({'BOTSID':'Line','Quantity':None})})
        lou.put({'BOTSID':'LX'},{'BOTSID':'W01','W0102':lin.get({'BOTSID':'Line','UOM':None})})
        lou.put({'BOTSID':'LX'},{'BOTSID':'W01','W0104':'VN'})
        lou.put({'BOTSID':'LX'},{'BOTSID':'W01','W0105':lin.get({'BOTSID':'Line','CodeBars':None})})
        lou.put({'BOTSID':'LX'},{'BOTSID':'W01','W0106':'BP'})
        lou.put({'BOTSID':'LX'},{'BOTSID':'W01','W0107':lin.get({'BOTSID':'Line','U_ALL_CUSTOM_BP_NO':None})})
        lou.put({'BOTSID':'LX'},{'BOTSID':'W01'},{'BOTSID':'G69','G6901':lin.get({'BOTSID':'Line','ItemName':None})})
        lin_row += 1

    out.put({'BOTSID':'ST'},{'BOTSID':'W76','W7601':out.getcountsum({'BOTSID':'ST'},{'BOTSID':'LX'},{'BOTSID':'W01','W0101':None}) })  #bots counts total Number of Units Shipped 
    out.put({'BOTSID':'ST'},{'BOTSID':'SE','SE01':out.getcount()+1,'SE02':out.ta_info['reference'].zfill(4)})  #SE01: bots counts the segments produced in the X12 message.
