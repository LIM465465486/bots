from bots.botsconfig import *

syntax = {
        'indented':True,
        }

structure = [
    {ID:'Document',MIN:1,MAX:1,
    QUERIES:{
        'frompartner':  {'BOTSID':'Document','sender':None},
        'topartner':    {'BOTSID':'Document','receiver':None},
        'testindicator':{'BOTSID':'Document','test':None},
        },
    LEVEL:[
        {ID:'Lines',MIN:0,MAX:1,LEVEL:[
            {ID:'Line',MIN:1,MAX:99999},
            ]},
        ]},
    ]

recorddefs = {
    'Document':[
            ['BOTSID','M',255,'A'],
            ['sender', 'M', 35, 'AN'],
            ['receiver', 'M', 35, 'AN'],
            ['testindicator', 'C', 3, 'AN'],
            ['ST02', 'C', 35, 'AN'],
            ['W0602', 'C', 35, 'AN'],
            ['W0603', 'C', 35, 'AN'],
            ['W0604', 'C', 35, 'AN'],
            ['W0606', 'C', 35, 'AN'],
        ],
    'Lines':[
            ['BOTSID','M',255,'A'],
          ],
    'Line':[
            ['BOTSID','M',255,'A'],
            ['LX01', 'C', 35, 'AN'],
            ['MAN01', 'C', 35, 'AN'],
            ['MAN02', 'C', 35, 'AN'],
            ['W1201', 'C', 35, 'AN'],
            ['W1202', 'C', 35, 'AN'],
            ['W1203', 'C', 35, 'AN'],
            ['W1204', 'C', 35, 'AN'],
            ['W1205', 'C', 35, 'AN'],
            ['W1206', 'C', 35, 'AN'],
            ['W1207', 'C', 35, 'AN'],
            ['W1208', 'C', 35, 'AN'],
            ['W1210', 'C', 35, 'AN'],
            ['W1211', 'C', 35, 'AN'],
            ['W1212', 'C', 35, 'AN'],
        ],
     }

