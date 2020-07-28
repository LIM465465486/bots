# mapping-script
# from x12lib import get_art_num  # import x12 specifc helper function
import bots.transform as transform  # import div bots helper functions


def main(inn, out):
    # pick up some values from ISA envelope
    out.put({'BOTSID': 'Document', 'sender': inn.ta_info['frompartner']})
    out.put({'BOTSID': 'Document', 'receiver': inn.ta_info['topartner']})
    out.put({'BOTSID': 'Document', 'testindicator': inn.ta_info['testindicator']})

    # pick up document number. is used in bots to give 'document-view'
    set_control_num = inn.get({'BOTSID': 'ST', 'ST02': None})
    out.put({'BOTSID': 'Document', 'ST02': set_control_num})
    inn.ta_info['botskey'] = set_control_num
    out.ta_info['botskey'] = set_control_num

    out.put({'BOTSID': 'Document', 'W0602': inn.get({'BOTSID': 'ST'}, {'BOTSID': 'W06', 'W0602': None})})
    out.put({'BOTSID': 'Document', 'W0603': transform.datemask(
        inn.get({'BOTSID': 'ST'}, {'BOTSID': 'W06', 'W0603': None}), 'CCYYMMDDHHMM', 'CCYY-MM-DD')})
    out.put({'BOTSID': 'Document', 'W0604': inn.get({'BOTSID': 'ST'}, {'BOTSID': 'W06', 'W0604': None})})
    out.put({'BOTSID': 'Document', 'W0606': inn.get({'BOTSID': 'ST'}, {'BOTSID': 'W06', 'W0606': None})})

    # out.put(
    #     {'BOTSID': 'Document', 'currency': inn.get({'BOTSID': 'ST'}, {'BOTSID': 'CUR', 'CUR01': 'BY', 'CUR02': None})})
    #
    # # loop over partys
    # for party in inn.getloop({'BOTSID': 'ST'}, {'BOTSID': 'N1'}):
    #     pou = out.putloop({'BOTSID': 'Document'}, {'BOTSID': 'partys'}, {'BOTSID': 'party'})
    #     pou.put({'BOTSID': 'party', 'qual': party.get({'BOTSID': 'N1', 'N101': None})})
    #     pou.put({'BOTSID': 'party', 'gln': party.get({'BOTSID': 'N1', 'N103': 'UL', 'N104': None})})
    #     # get DUNS number. 2 qualifiers are used; helper function transform.useoneof checks both
    #     pou.put({'BOTSID': 'party', 'DUNS': transform.useoneof(party.get({'BOTSID': 'N1', 'N103': '1', 'N104': None}),
    #                                                            party.get({'BOTSID': 'N1', 'N103': '9', 'N104': None}))})
    #     pou.put({'BOTSID': 'party', 'externalID': party.get({'BOTSID': 'N1', 'N103': '92', 'N104': None})})
    #     pou.put({'BOTSID': 'party', 'internalID': party.get({'BOTSID': 'N1', 'N103': '91', 'N104': None})})
    #     pou.put({'BOTSID': 'party', 'name1': party.get({'BOTSID': 'N1', 'N102': None})})
    #     pou.put({'BOTSID': 'party', 'name2': party.get({'BOTSID': 'N1'}, {'BOTSID': 'N2', 'N201': None})})
    #     pou.put({'BOTSID': 'party', 'address1': party.get({'BOTSID': 'N1'}, {'BOTSID': 'N3', 'N301': None})})
    #     pou.put({'BOTSID': 'party', 'address2': party.get({'BOTSID': 'N1'}, {'BOTSID': 'N3', 'N302': None})})
    #     pou.put({'BOTSID': 'party', 'city': party.get({'BOTSID': 'N1'}, {'BOTSID': 'N4', 'N401': None})})
    #     pou.put({'BOTSID': 'party', 'state': party.get({'BOTSID': 'N1'}, {'BOTSID': 'N4', 'N402': None})})
    #     pou.put({'BOTSID': 'party', 'pcode': party.get({'BOTSID': 'N1'}, {'BOTSID': 'N4', 'N403': None})})
    #     pou.put({'BOTSID': 'party', 'country': party.get({'BOTSID': 'N1'}, {'BOTSID': 'N4', 'N404': None})})
    #
    # # mapping above is for full addresses. Often only party-IDs are used (good EDI practices.....
    # # mapping could be simpler, eg:
    # # ~ out.put({'BOTSID':'Document','buyer_ID':inn.get({'BOTSID':'ST'},{'BOTSID':'N1','N101':'BY','N4':None})})
    # # ~ out.put({'BOTSID':'Document','delivery_ID':inn.get({'BOTSID':'ST'},{'BOTSID':'N1','N101':'ST','N4':None})})
    #
    # loop over lines
    for line in inn.getloop({'BOTSID': 'ST'}, {'BOTSID': 'LX'}):
        lou = out.putloop({'BOTSID': 'Document'}, {'BOTSID': 'Lines'}, {'BOTSID': 'Line'})
        set_control_num
        lou.put({'BOTSID': 'Line', 'ST02': set_control_num})
        lou.put({'BOTSID': 'Line', 'LX01': line.get({'BOTSID': 'LX', 'LX01': None})})
        lou.put({'BOTSID': 'Line', 'MAN01': line.get({'BOTSID': 'LX'}, {'BOTSID': 'MAN', 'MAN01': None})})
        lou.put({'BOTSID': 'Line', 'MAN02': line.get({'BOTSID': 'LX'}, {'BOTSID': 'MAN', 'MAN02': None})})
        lou.put({'BOTSID': 'Line', 'W1201': line.get({'BOTSID': 'LX'}, {'BOTSID': 'W12', 'W1201': None})})
        lou.put({'BOTSID': 'Line', 'W1202': line.get({'BOTSID': 'LX'}, {'BOTSID': 'W12', 'W1202': None})})
        lou.put({'BOTSID': 'Line', 'W1203': line.get({'BOTSID': 'LX'}, {'BOTSID': 'W12', 'W1203': None})})
        lou.put({'BOTSID': 'Line', 'W1204': line.get({'BOTSID': 'LX'}, {'BOTSID': 'W12', 'W1204': None})})
        lou.put({'BOTSID': 'Line', 'W1205': line.get({'BOTSID': 'LX'}, {'BOTSID': 'W12', 'W1205': None})})
        lou.put({'BOTSID': 'Line', 'W1206': line.get({'BOTSID': 'LX'}, {'BOTSID': 'W12', 'W1206': None})})
        lou.put({'BOTSID': 'Line', 'W1207': line.get({'BOTSID': 'LX'}, {'BOTSID': 'W12', 'W1207': None})})
        lou.put({'BOTSID': 'Line', 'W1208': line.get({'BOTSID': 'LX'}, {'BOTSID': 'W12', 'W1208': None})})
        lou.put({'BOTSID': 'Line', 'W1210': line.get({'BOTSID': 'LX'}, {'BOTSID': 'W12', 'W1210': None})})
        lou.put({'BOTSID': 'Line', 'W1211': line.get({'BOTSID': 'LX'}, {'BOTSID': 'W12', 'W1211': None})})
        lou.put({'BOTSID': 'Line', 'W1212': line.get({'BOTSID': 'LX'}, {'BOTSID': 'W12', 'W1212': None})})
