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

    out.put({'BOTSID': 'Document', 'W1704': inn.get({'BOTSID': 'ST'}, {'BOTSID': 'W17', 'W1704': None})})
    out.put({'BOTSID': 'Document', 'N902': inn.get({'BOTSID': 'ST'}, {'BOTSID': 'N9', 'N902': None})})
