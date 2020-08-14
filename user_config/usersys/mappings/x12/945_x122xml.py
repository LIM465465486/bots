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

    out.put({'BOTSID': 'Document', 'G6202': transform.datemask(
        inn.get({'BOTSID': 'ST'}, {'BOTSID': 'G62', 'G6202': None}), 'CCYYMMDDHHMM', 'CCYY-MM-DD')})
    out.put({'BOTSID': 'Document', 'W2701': inn.get({'BOTSID': 'ST'}, {'BOTSID': 'W27', 'W2701': None})})
    out.put({'BOTSID': 'Document', 'W2702': inn.get({'BOTSID': 'ST'}, {'BOTSID': 'W27', 'W2702': None})})
    out.put({'BOTSID': 'Document', 'W2703': inn.get({'BOTSID': 'ST'}, {'BOTSID': 'W27', 'W2703': None})})
    out.put({'BOTSID': 'Document', 'W2704': inn.get({'BOTSID': 'ST'}, {'BOTSID': 'W27', 'W2704': None})})

    # loop over lines
    for line in inn.getloop({'BOTSID': 'ST'}, {'BOTSID': 'LX'}):
        lou = out.putloop({'BOTSID': 'Document'}, {'BOTSID': 'Lines'}, {'BOTSID': 'Line'})
        set_control_num
        lou.put({'BOTSID': 'Line', 'ST02': set_control_num})
        lou.put({'BOTSID': 'Line', 'LX01': line.get({'BOTSID': 'LX', 'LX01': None})})
        lou.put({'BOTSID': 'Line', 'MAN01': line.get({'BOTSID': 'LX'}, {'BOTSID': 'MAN', 'MAN01': None})})
        lou.put({'BOTSID': 'Line', 'MAN02': line.get({'BOTSID': 'LX'}, {'BOTSID': 'MAN', 'MAN02': None})})
        lou.put({'BOTSID': 'Line', 'MAN04': line.get({'BOTSID': 'LX'}, {'BOTSID': 'MAN', 'MAN04': None})})
        lou.put({'BOTSID': 'Line', 'MAN05': line.get({'BOTSID': 'LX'}, {'BOTSID': 'MAN', 'MAN05': None})})
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
        lou.put({'BOTSID': 'Line', 'AMT02': line.get({'BOTSID': 'LX'}, {'BOTSID': 'W12'}, {'BOTSID': 'AMT', 'AMT02': None})})
