from bots.botsconfig import *

syntax = {
        'indented': True,
        }

structure = [
    {ID: 'Document', MIN: 1, MAX: 1,
    QUERIES:{
        'frompartner':  {'BOTSID':'Document','sender':None},
        'topartner':    {'BOTSID':'Document','receiver':None},
        'testindicator':{'BOTSID':'Document','test':None},
        },
     }
    ]

recorddefs = {
    'Document': [
            ['BOTSID','M',255,'A'],
            ['sender', 'M', 35, 'AN'],
            ['receiver', 'M', 35, 'AN'],
            ['testindicator', 'C', 3, 'AN'],
            ['ST02', 'C', 35, 'AN'],
            ['W1704', 'C', 35, 'AN'],
            ['N902', 'C', 35, 'AN'],
        ],
     }

