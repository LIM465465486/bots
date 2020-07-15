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
            ['docsrt', 'C', 3, 'AN'],
            ['CardCode', 'C', 35, 'AN'],
            ['CardName', 'C', 100, 'AN'],
            ['DocEntry', 'C', 35, 'AN'],
            ['DocNum', 'C', 35, 'AN'],
            ['docdtm', 'C', 35, 'AN'],
            ['deldtm', 'C', 35, 'AN'],
            ['earldeldtm', 'C', 35, 'AN'],
            ['latedeldtm', 'C', 35, 'AN'],
            ['currency', 'C', 3, 'AN'],
            ['DocDate', 'C', 35, 'AN'],
            ['DocDueDate', 'C', 35, 'AN'],
            ['NumAtCard', 'C', 35, 'AN'],
            ['Street', 'C', 35, 'AN'],
            ['Address3', 'C', 35, 'AN'],
            ['City', 'C', 35, 'AN'],
            ['State', 'C', 35, 'AN'],
            ['ZipCode', 'C', 35, 'AN'],
            ['Country', 'C', 35, 'AN'],
            ['TrnspName', 'C', 35, 'AN'],
            ['N902', 'C', 4, 'AN'],
        ],
    'Lines':[
            ['BOTSID','M',255,'A'],
          ],
    'Line':[
            ['BOTSID','M',255,'A'],
            ['LineRow', 'C', 6, 'AN'],
            ['ItemCode', 'C', 35, 'AN'],
            ['ItemName', 'C', 45, 'AN'],
            ['Quantity', 'C', 35, 'AN'],
            ['CodeBars', 'C', 35, 'AN'],
        ],
     }
 
