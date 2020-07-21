import bots.transform as transform

def main(inn, out):
    # sender, receiver is correct via QUERIES in grammar. test2
    out.put({'BOTSID': 'ST', 'ST01': '943', 'ST02': out.ta_info['reference'].zfill(4)})

    out.put({'BOTSID': 'ST'}, {'BOTSID': 'W06', 'W0601': 'F'})
    out.put({'BOTSID': 'ST'}, {'BOTSID': 'W06', 'W0602': inn.get({'BOTSID': 'Document', 'DocEntry': None})})
    out.put({'BOTSID': 'ST'}, {'BOTSID': 'W06', 'W0603': transform.datemask(inn.get({'BOTSID': 'Document', 'DocDueDate': None}),'CCYY-MM-DD HH:mm','CCYYMMDD')})
    out.put({'BOTSID': 'ST'}, {'BOTSID': 'W06', 'W0604': inn.get({'BOTSID': 'Document', 'DocEntry': None})})
    if inn.get({'BOTSID': 'Document', 'NumAtCard': None}):
        out.put({'BOTSID': 'ST'}, {'BOTSID': 'W06', 'W0605': inn.get({'BOTSID': 'Document', 'NumAtCard': None})})
    else:
        out.put({'BOTSID': 'ST'}, {'BOTSID': 'W06', 'W0605': inn.get({'BOTSID': 'Document', 'DocEntry': None})})

    nou = out.putloop({'BOTSID': 'ST'}, {'BOTSID': 'N1'})
    nou.put({'BOTSID': 'N1', 'N101': 'SF'})
    nou.put({'BOTSID': 'N1', 'N102': inn.get({'BOTSID': 'Document', 'CardName': None})})
    nou.put({'BOTSID': 'N1'}, {'BOTSID': 'N3', 'N301': inn.get({'BOTSID': 'Document', 'Street': None})})
    nou.put({'BOTSID': 'N1'}, {'BOTSID': 'N3', 'N302': inn.get({'BOTSID': 'Document', 'Address3': None})})
    nou.put({'BOTSID': 'N1'}, {'BOTSID': 'N4', 'N401': inn.get({'BOTSID': 'Document', 'City': None})})
    nou.put({'BOTSID': 'N1'}, {'BOTSID': 'N4', 'N402': inn.get({'BOTSID': 'Document', 'State': None})})
    nou.put({'BOTSID': 'N1'}, {'BOTSID': 'N4', 'N403': inn.get({'BOTSID': 'Document', 'ZipCode': None})})
    nou.put({'BOTSID': 'N1'}, {'BOTSID': 'N4', 'N404': inn.get({'BOTSID': 'Document', 'Country': None})})

    out.put({'BOTSID': 'ST'}, {'BOTSID': 'N9', 'N901': '06',  'N902': inn.get({'BOTSID': 'Document', 'N902': None})})

    out.put({'BOTSID': 'ST'},
            {'BOTSID': 'G62', 'G6201': '70', 'G6202' : transform.datemask(inn.get({'BOTSID': 'Document', 'DocDueDate': None}),'CCYY-MM-DD HH:mm','CCYYMMDD')})

    out.put({'BOTSID': 'ST'}, {'BOTSID': 'W27', 'W2701': 'S'})

    # loop over lines***************************************
    lin_row = 1
    for lin in inn.getloop({'BOTSID': 'Document'}, {'BOTSID': 'Lines'}, {'BOTSID': 'Line'}):
        lou = out.putloop({'BOTSID': 'ST'}, {'BOTSID': 'W04'})
        lou.put({'BOTSID': 'W04', 'W0401': int(float(lin.get({'BOTSID': 'Line', 'Quantity': None})))})
        lou.put({'BOTSID': 'W04', 'W0402': 'EA'})
        lou.put({'BOTSID': 'W04', 'W0403': lin.get({'BOTSID': 'Line', 'CodeBars': None})})
        lou.put({'BOTSID': 'W04', 'W0404': 'VN'})
        lou.put({'BOTSID': 'W04', 'W0405': lin.get({'BOTSID': 'Line', 'ItemCode': None})})
        lin_row += 1

    out.put({'BOTSID': 'ST'}, {'BOTSID': 'W03', 'W0301': out.getcountsum({'BOTSID': 'ST'}, {'BOTSID': 'W04', 'W0401': None})})  # bots counts total Number of Units Shipped
    out.put({'BOTSID': 'ST'}, {'BOTSID': 'SE', 'SE01': out.getcount() + 1, 'SE02': out.ta_info['reference'].zfill(
        4)})  # SE01: bots counts the segments produced in the X12 message.
