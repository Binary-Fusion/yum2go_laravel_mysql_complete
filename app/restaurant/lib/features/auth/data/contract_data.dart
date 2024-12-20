import 'package:stackfood_multivendor_restaurant/features/auth/domain/models/risk_discloser_data.dart';

class ContractData {
  static String getData(
    RiskDiscloserData data,
  ) {
    return """
<style type="text/css">
    p.p1 {
        margin: 0.0px 0.0px 6.2px 0.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p2 {
        margin: 0.0px 0.0px 0.2px 0.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p3 {
        margin: 0.0px 0.0px 8.5px 0.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p4 {
        margin: 0.0px 0.0px 7.0px 0.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p5 {
        margin: 0.0px 0.0px 7.2px 0.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p6 {
        margin: 0.0px 0.0px 8.4px 0.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p7 {
        margin: 0.0px 0.0px 7.0px 72.7px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p8 {
        margin: 0.0px 0.0px 7.0px 75.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p9 {
        margin: 0.0px 0.0px 0.3px 7.9px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p10 {
        margin: 0.0px 0.0px 0.3px 72.3px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p11 {
        margin: 0.0px 0.0px 0.1px 0.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p12 {
        margin: 0.0px 0.0px 0.1px 72.6px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p13 {
        margin: 0.0px 0.0px 0.0px 36.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p14 {
        margin: 0.0px 0.0px 0.1px 36.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p15 {
        margin: 0.0px 0.0px 0.0px 36.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p16 {
        margin: 0.0px 0.0px 0.0px 73.2px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p17 {
        margin: 0.0px 0.0px 0.0px 7.9px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p18 {
        margin: 0.0px 0.0px 0.0px 7.9px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p19 {
        margin: 0.0px 0.0px 8.4px 0.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p20 {
        margin: 0.0px 0.0px 8.5px 8.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p21 {
        margin: 0.0px 0.0px 7.1px 0.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p22 {
        margin: 0.0px 0.0px 8.5px 0.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p23 {
        margin: 0.0px 0.0px 7.0px 8.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p24 {
        margin: 0.0px 0.0px 0.0px 0.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p25 {
        margin: 0.0px 0.0px 7.0px 0.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p26 {
        margin: 0.0px 0.0px 7.2px 8.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p27 {
        margin: 0.0px 0.0px 6.9px 8.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p28 {
        margin: 0.0px 0.0px 6.9px 74.4px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p29 {
        margin: 0.0px 0.0px 0.0px 74.4px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p30 {
        margin: 0.0px 0.0px 0.0px 72.8px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p31 {
        margin: 0.0px 0.0px 3.9px 0.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p32 {
        margin: 0.0px 0.0px 0.2px 73.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p33 {
        margin: 0.0px 0.0px 0.0px 0.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p34 {
        margin: 0.0px 0.0px 0.0px 73.1px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p35 {
        margin: 0.0px 0.0px 7.2px 73.1px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p36 {
        margin: 0.0px 0.0px 7.2px 72.2px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p37 {
        margin: 0.0px 0.0px 0.1px 72.2px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p38 {
        margin: 0.0px 0.0px 5.4px 74.7px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p39 {
        margin: 0.0px 0.0px 8.9px 28.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p40 {
        margin: 0.0px 0.0px 7.7px 72.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p41 {
        margin: 0.0px 0.0px 8.8px 72.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p42 {
        margin: 0.0px 0.0px 9.7px 72.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p43 {
        margin: 0.0px 0.0px 8.7px 72.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p44 {
        margin: 0.0px 0.0px 9.8px 72.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p45 {
        margin: 0.0px 0.0px 7.3px 72.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p46 {
        margin: 0.0px 0.0px 6.3px 72.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p47 {
        margin: 0.0px 0.0px 5.3px 72.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p48 {
        margin: 0.0px 0.0px 7.5px 72.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p49 {
        margin: 0.0px 0.0px 7.6px 72.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p50 {
        margin: 0.0px 0.0px 7.0px 72.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p51 {
        margin: 0.0px 0.0px 8.6px 72.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p52 {
        margin: 0.0px 0.0px 7.9px 72.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p53 {
        margin: 0.0px 0.0px 8.2px 72.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p54 {
        margin: 0.0px 0.0px 6.0px 72.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p55 {
        margin: 0.0px 0.0px 6.0px 72.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p56 {
        margin: 0.0px 0.0px 0.0px 72.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p57 {
        margin: 0.0px 0.0px 8.9px 71.1px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p58 {
        margin: 0.0px 0.0px 0.0px 73.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p59 {
        margin: 0.0px 0.0px 4.2px 0.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p60 {
        margin: 0.0px 0.0px 4.2px 72.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p61 {
        margin: 0.0px 0.0px 8.9px 72.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p62 {
        margin: 0.0px 0.0px 8.3px 108.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p63 {
        margin: 0.0px 0.0px 5.0px 108.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p64 {
        margin: 0.0px 0.0px 6.8px 108.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p65 {
        margin: 0.0px 0.0px 7.4px 108.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p66 {
        margin: 0.0px 0.0px 4.9px 108.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p67 {
        margin: 0.0px 0.0px 7.6px 108.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p68 {
        margin: 0.0px 0.0px 7.5px 108.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p69 {
        margin: 0.0px 0.0px 8.4px 108.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p70 {
        margin: 0.0px 0.0px 0.0px 108.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p71 {
        margin: 0.0px 0.0px 9.1px 108.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p72 {
        margin: 0.0px 0.0px 8.3px 7.9px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p73 {
        margin: 0.0px 0.0px 7.9px 36.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p74 {
        margin: 0.0px 0.0px 7.5px 108.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p75 {
        margin: 0.0px 0.0px 4.6px 72.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p76 {
        margin: 0.0px 0.0px 7.4px 108.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p77 {
        margin: 0.0px 0.0px 5.9px 108.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p78 {
        margin: 0.0px 0.0px 9.2px 108.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p79 {
        margin: 0.0px 0.0px 8.2px 108.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p80 {
        margin: 0.0px 0.0px 9.3px 7.9px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p81 {
        margin: 0.0px 0.0px 9.3px 108.0px;
        text-align: justify;
        font: 18.0px Arial;
        color: #000000
    }

    p.p82 {
        margin: 0.0px 0.0px 8.2px 108.0px;
        text-align: justify;
        font: 18.0px Arial;
        color: #000000
    }

    p.p83 {
        margin: 0.0px 0.0px 8.1px 108.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p84 {
        margin: 0.0px 0.0px 8.9px 0.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p85 {
        margin: 0.0px 0.0px 3.3px 0.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p86 {
        margin: 0.0px 0.0px 3.3px 76.2px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p87 {
        margin: 0.0px 0.0px 7.2px 76.2px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p88 {
        margin: 0.0px 0.0px 7.2px 72.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p89 {
        margin: 0.0px 0.0px 8.6px 72.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p90 {
        margin: 0.0px 0.0px 8.1px 72.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p91 {
        margin: 0.0px 0.0px 0.3px 72.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p92 {
        margin: 0.0px 0.0px 3.6px 0.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p93 {
        margin: 0.0px 0.0px 0.0px 72.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p94 {
        margin: 0.0px 0.0px 8.1px 28.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p95 {
        margin: 0.0px 0.0px 8.1px 0.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p96 {
        margin: 0.0px 0.0px 8.1px 72.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p97 {
        margin: 0.0px 0.0px 3.6px 72.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p98 {
        margin: 0.0px 0.0px 8.6px 73.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p99 {
        margin: 0.0px 0.0px 9.1px 36.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p100 {
        margin: 0.0px 0.0px 8.1px 71.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p101 {
        margin: 0.0px 0.0px 7.5px 72.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p102 {
        margin: 0.0px 0.0px 8.1px 36.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p103 {
        margin: 0.0px 0.0px 8.3px 72.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p104 {
        margin: 0.0px 0.0px 8.3px 72.0px;
        text-align: justify;
        font: 18.0px Arial;
        color: #000000
    }

    p.p105 {
        margin: 0.0px 0.0px 4.0px 72.0px;
        text-align: justify;
        font: 18.0px Arial;
        color: #000000
    }

    p.p106 {
        margin: 0.0px 0.0px 7.1px 0.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p107 {
        margin: 0.0px 0.0px 0.3px 36.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p108 {
        margin: 0.0px 0.0px 0.1px 72.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p109 {
        margin: 0.0px 0.0px 3.5px 72.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p110 {
        margin: 0.0px 0.0px 3.5px 72.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p111 {
        margin: 0.0px 0.0px 6.3px 72.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p112 {
        margin: 0.0px 0.0px 8.9px 72.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p113 {
        margin: 0.0px 0.0px 7.2px 72.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p114 {
        margin: 0.0px 0.0px 6.8px 72.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p115 {
        margin: 0.0px 0.0px 6.8px 72.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p116 {
        margin: 0.0px 0.0px 4.0px 72.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p117 {
        margin: 0.0px 0.0px 8.2px 0.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p118 {
        margin: 0.0px 0.0px 3.2px 36.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p119 {
        margin: 0.0px 0.0px 3.2px 71.5px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p120 {
        margin: 0.0px 0.0px 7.2px 28.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p121 {
        margin: 0.0px 0.0px 0.1px 73.5px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p122 {
        margin: 0.0px 0.0px 0.1px 0.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p123 {
        margin: 0.0px 0.0px 9.7px 0.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p124 {
        margin: 0.0px 0.0px 7.3px 72.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p125 {
        margin: 0.0px 0.0px 4.5px 72.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p126 {
        margin: 0.0px 0.0px 4.5px 72.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p127 {
        margin: 0.0px 0.0px 3.9px 36.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p128 {
        margin: 0.0px 0.0px 3.9px 71.8px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p129 {
        margin: 0.0px 0.0px 6.8px 36.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p130 {
        margin: 0.0px 0.0px 0.2px 74.7px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p131 {
        margin: 0.0px 0.0px 3.9px 72.8px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p132 {
        margin: 0.0px 0.0px 3.1px 28.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p133 {
        margin: 0.0px 0.0px 9.1px 74.1px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p134 {
        margin: 0.0px 0.0px 4.0px 74.1px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p135 {
        margin: 0.0px 0.0px 4.0px 76.4px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p136 {
        margin: 0.0px 0.0px 4.0px 76.4px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p137 {
        margin: 0.0px 0.0px 5.0px 76.4px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p138 {
        margin: 0.0px 0.0px 7.1px 72.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p139 {
        margin: 0.0px 0.0px 8.0px 72.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p140 {
        margin: 0.0px 0.0px 8.0px 107.8px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p141 {
        margin: 0.0px 0.0px 4.3px 72.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p142 {
        margin: 0.0px 0.0px 0.3px 106.7px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p143 {
        margin: 0.0px 0.0px 6.4px 0.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p144 {
        margin: 0.0px 0.0px 0.1px 108.3px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p145 {
        margin: 0.0px 0.0px 7.8px 0.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p146 {
        margin: 0.0px 0.0px 0.1px 106.6px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p147 {
        margin: 0.0px 0.0px 8.7px 72.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p148 {
        margin: 0.0px 0.0px 5.0px 107.8px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p149 {
        margin: 0.0px 0.0px 4.0px 0.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p150 {
        margin: 0.0px 0.0px 4.0px 36.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p151 {
        margin: 0.0px 0.0px 0.0px 107.8px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p152 {
        margin: 0.0px 0.0px 0.0px 144.3px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p153 {
        margin: 0.0px 0.0px 6.8px 28.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p154 {
        margin: 0.0px 0.0px 3.0px 106.9px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p155 {
        margin: 0.0px 0.0px 7.0px 28.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p156 {
        margin: 0.0px 0.0px 6.7px 36.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p157 {
        margin: 0.0px 0.0px 6.7px 108.3px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p158 {
        margin: 0.0px 0.0px 0.0px 28.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p159 {
        margin: 0.0px 0.0px 0.0px 71.8px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p160 {
        margin: 0.0px 0.0px 0.4px 0.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p161 {
        margin: 0.0px 0.0px 3.8px 0.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    p.p162 {
        margin: 0.0px 0.0px 3.8px 28.0px;
        font: 18.0px Arial;
        color: #000000
    }

    p.p163 {
        margin: 0.0px 0.0px 5.0px 28.0px;
        font: 12.0px 'Times New Roman';
        min-height: 15.0px
    }

    span.s1 {
        letter-spacing: 0.8px
    }

    span.s2 {
        letter-spacing: -0.8px
    }

    span.s3 {
        letter-spacing: -0.7px
    }

    span.s4 {
        letter-spacing: -0.6px
    }

    span.s5 {
        letter-spacing: -0.5px
    }

    span.s6 {
        letter-spacing: -0.2px
    }

    span.s7 {
        letter-spacing: 0.4px
    }

    span.s8 {
        letter-spacing: 0.5px
    }

    span.s9 {
        letter-spacing: -0.1px
    }

    span.s10 {
        text-decoration: underline
    }

    span.s11 {
        text-decoration: underline;
        letter-spacing: 2.0px
    }

    span.s12 {
        letter-spacing: -1.2px
    }

    span.s13 {
        letter-spacing: -1.1px
    }

    span.s14 {
        letter-spacing: -1.4px
    }

    span.s15 {
        letter-spacing: -1.0px
    }

    span.s16 {
        letter-spacing: 2.0px
    }

    span.s17 {
        letter-spacing: -0.3px
    }

    span.s18 {
        letter-spacing: -0.4px
    }

    span.s19 {
        letter-spacing: -0.9px
    }

    span.s20 {
        letter-spacing: 1.6px
    }

    span.s21 {
        letter-spacing: 1.4px
    }

    span.s22 {
        letter-spacing: 1.2px
    }

    span.s23 {
        text-decoration: underline;
        letter-spacing: 1.6px
    }

    span.s24 {
        text-decoration: underline;
        letter-spacing: -0.1px
    }

    span.s25 {
        text-decoration: underline;
        letter-spacing: -0.5px
    }

    span.s26 {
        text-decoration: underline;
        letter-spacing: -0.6px
    }

    span.s27 {
        letter-spacing: 1.1px
    }

    span.s28 {
        text-decoration: underline;
        letter-spacing: -0.2px
    }

    span.s29 {
        letter-spacing: 0.1px
    }

    span.s30 {
        letter-spacing: 0.2px
    }

    span.s31 {
        letter-spacing: 0.6px
    }

    span.s32 {
        letter-spacing: 0.9px
    }

    span.s33 {
        letter-spacing: 1.3px
    }

    span.s34 {
        letter-spacing: 1.0px
    }

    span.s35 {
        letter-spacing: 0.3px
    }

    span.s36 {
        letter-spacing: -1.3px
    }

    span.s37 {
        letter-spacing: 0.7px
    }

    span.s38 {
        letter-spacing: -1.5px
    }

    span.s39 {
        letter-spacing: -1.8px
    }

    span.s40 {
        letter-spacing: 1.8px
    }

    span.s41 {
        letter-spacing: 3.1px
    }

    span.s42 {
        text-decoration: underline;
        letter-spacing: -0.3px
    }

    span.s43 {
        text-decoration: underline;
        letter-spacing: 0.7px
    }

    span.s44 {
        letter-spacing: -1.6px
    }

    span.s45 {
        letter-spacing: 1.5px
    }

    span.s46 {
        text-decoration: underline;
        letter-spacing: 0.9px
    }

    span.s47 {
        letter-spacing: 1.9px
    }

    span.s48 {
        letter-spacing: -1.7px
    }

    span.s49 {
        letter-spacing: 1.7px
    }

    span.s50 {
        text-decoration: underline;
        letter-spacing: -0.4px
    }

    span.s51 {
        letter-spacing: -1.9px
    }

    span.s52 {
        letter-spacing: 3.4px
    }

    span.s53 {
        letter-spacing: 4.0px
    }

    span.s54 {
        letter-spacing: 3.0px
    }

    span.s55 {
        letter-spacing: 2.4px
    }

    span.s56 {
        letter-spacing: 3.3px
    }

    span.s57 {
        letter-spacing: 3.2px
    }

    span.s58 {
        text-decoration: underline;
        letter-spacing: 0.1px
    }

    span.Apple-tab-span {
        white-space: pre
    }
</style>
<p><strong>STANDARD PROTOCOLS</strong></p>
<p><strong>Our</strong><strong>&nbsp;</strong><strong>Responsibilities</strong>: YUM2GO (&quot;Platform&quot;) provides an ****** marketplace &nbsp;using web-based ********** that connects Merchants, independent ******** *********** (&quot;Drivers&rdquo;) and customers. *** YUM2GO ******** permits customers ** place orders for **** or ***** products from Merchants; YUM2** then notifies Drivers **** a delivery *********** is available; ***** a ****** ************ their acceptance of *** delivery, &nbsp;YUM2GO *********** the (&quot;Driver&rsquo;s&rdquo;) completion of the delivery of the Merchant&apos;s ******** ** the customer. YUM2GO is not a merchant, food preparation business, ******** or ******** service; it is ** online connection platform.</p>
<p><br></p>
<p><strong>Your</strong><strong>&nbsp;</strong><strong>Responsibilities</strong>:&nbsp;You&nbsp;fulfill&nbsp;orders&nbsp;placed&nbsp;on&nbsp;the&nbsp;YUM2GO&nbsp;Platform&nbsp;and&nbsp;provide&nbsp;them&nbsp;to&nbsp;Drivers&nbsp;or&nbsp;customers. Instead ** collecting&nbsp;payment&nbsp;at&nbsp;the&nbsp;time&nbsp;of&nbsp;pickup,&nbsp;you&nbsp;will charge&nbsp;the&nbsp;total&nbsp;sales&nbsp;price&nbsp;for&nbsp;each&nbsp;order&nbsp;(including&nbsp;*** taxes&nbsp;and&nbsp;other&nbsp;government&nbsp;charges) ** an ******* *** maintain for ****** on the YUM2GO Platform.</p>
<p><br></p>
<p><strong>Payment</strong><strong>&nbsp;</strong><strong>&amp;</strong><strong>&nbsp;</strong><strong>Pricing</strong>:&nbsp;Each&nbsp;week,&nbsp;YUM2GO&nbsp;will&nbsp;settle&nbsp;your&nbsp;YUM2GO&nbsp;account&nbsp;by&nbsp;paying&nbsp;you:</p>
<p>&nbsp; &nbsp; &bull; &nbsp; &nbsp;the pre-tax ***** of all ****** for the ***** week, unless (you requested an Instant Pay) including the ***** sales tax on all such &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; orders, minus.</p>
<p>&nbsp; &nbsp; &bull; &nbsp; &nbsp;*** YUM2GO advertisement fee, any ************ fees, *** any other **** ** ***** *** agreed will be deducted. *** *** the &nbsp; &nbsp; &nbsp; &nbsp; &quot;retailer&quot; or &quot;seller&quot; responsible for ********* all ***** tax *** ***** governmental charges. You are also responsible *** ******* &nbsp; &nbsp; &nbsp; &nbsp; the ***** for each item to be made available on the YUM2GO Platform.</p>
<p>&nbsp; &nbsp; &bull; &nbsp; &nbsp;Instant Pay is an ****** that *** merchants can choose twice a week for a *** ** \$<strong>29.99</strong><strong>&nbsp;</strong>each payout. This ****** gives *** ** &nbsp; &nbsp; &nbsp; &nbsp; the ********** the choice to ******* your money earlier.</p>
<p><br></p>
<p><strong>Fees</strong>:&nbsp;YUM2GO<strong>&rsquo;s</strong><strong>&nbsp;</strong><strong>commission</strong><strong>&nbsp;</strong><strong>(&quot;Subscription</strong><strong>&nbsp;</strong><strong>Fee&quot;)</strong><strong>&nbsp;</strong><strong>is</strong><strong>&nbsp;</strong><strong>** ongoing \$99.99 *** **** ************ Fee.</strong><strong>&nbsp;</strong>This&nbsp;Fee applies&nbsp;to&nbsp;all orders&nbsp;placed&nbsp;on&nbsp;the&nbsp;YUM2GO&nbsp;Platform&nbsp;that&nbsp;originate&nbsp;from&nbsp;the&nbsp;YUM2GO&nbsp;App&nbsp;or&nbsp;YUM2GO&nbsp;website,&nbsp;including&nbsp;both delivery&nbsp;and&nbsp;****** orders. Merchant agrees&nbsp;YUM2GO may&nbsp;****** the&nbsp;******** fees,&nbsp;including a Delivery&nbsp;Fee&nbsp;and/** Service&nbsp;Fee,&nbsp;Item&nbsp;Fee,&nbsp;Cancellation&nbsp;Fees,&nbsp;etc.&nbsp;YUM2GO&nbsp;may&nbsp;charge&nbsp;an&nbsp;additional&nbsp;markup&nbsp;for&nbsp;Merchants&nbsp;Products at&nbsp;any time&nbsp;during&nbsp;this&nbsp;contractual&nbsp;agreement.</p>
<p><br></p>
<p><strong>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</strong><strong>Info</strong><strong>&nbsp;</strong><strong>for</strong><strong>&nbsp;</strong><strong>Weekly</strong><strong>&nbsp;</strong><strong>Payments</strong><strong>&nbsp;</strong><strong>and</strong><strong>&nbsp;</strong><strong>Order</strong><strong>&nbsp;</strong><strong>Placement</strong>:&nbsp;YUM2GO&nbsp;will&nbsp;provide&nbsp;weekly&nbsp;payment&nbsp;using&nbsp;the&nbsp;information&nbsp;you</p>
<p>&nbsp; &nbsp; &nbsp; &nbsp; provide above *** in *** YUM2GO Sign-** ***** appendix, if applicable. Orders **** be transmitted to you as follows<strong>:</strong></p>
<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; Bundle:</strong></p>
<p>&nbsp; &nbsp; &nbsp; &nbsp; N/A</p>
<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; Order</strong><strong>&nbsp;</strong><strong>Protocol:</strong></p>
<p>&nbsp; &nbsp; &nbsp; &nbsp; Email</p>
<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; POS</strong><strong>&nbsp;</strong><strong>System</strong><strong>&nbsp;</strong><strong>Fee:</strong></p>
<p>&nbsp; &nbsp; &nbsp; &nbsp; N/A</p>
<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; POS</strong><strong>&nbsp;</strong><strong>Subscription</strong><strong>&nbsp;</strong><strong>Fee:</strong></p>
<p>&nbsp; &nbsp; &nbsp; &nbsp; N/A</p>
<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; Order</strong><strong>&nbsp;</strong><strong>Protocol</strong><strong>&nbsp;</strong><strong>Email</strong>:</p>
<p><br></p>
<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; Order</strong><strong>&nbsp;</strong><strong>Protocol</strong><strong>&nbsp;</strong><strong>Fax</strong>:</p>
<p>&nbsp; &nbsp; &nbsp; &nbsp; N/A</p>
<p><br></p>
<p><strong>Cancel anytime **** 30-day</strong><strong>s</strong><strong>&nbsp;</strong><strong>notice</strong><strong>:&nbsp;</strong>Merchant&nbsp;may&nbsp;cancel&nbsp;this&nbsp;agreement&nbsp;at&nbsp;any&nbsp;time&nbsp;for&nbsp;any&nbsp;reason&nbsp;after&nbsp;giving YUM2GO&nbsp;at&nbsp;least&nbsp;30&nbsp;days&nbsp;prior&nbsp;written&nbsp;notice.&nbsp;YUM2GO&nbsp;may&nbsp;cancel&nbsp;this agreement&nbsp;at&nbsp;any&nbsp;time&nbsp;for&nbsp;any&nbsp;reason.</p>
<p><br></p>
<p><strong>Merchants Fee</strong><strong>:&nbsp;</strong>*** ********* **** register will be charged an additional onboarding sign-up fee of <strong>\$99.99&nbsp;</strong>which will be charged ** the time of activation for a Trial ****** of 30 days. ***** THE *** OF *** 30-DAY ***** PERIOD, YOU WILL AUTOMATICALLY ********** TO A WEEKLY RECURRING SUBSCRIPTION *** OF <strong>\$99.99</strong> FOR ALL FUTURE ORDERS. If you do *** want to ******** past **** ***** period, you can cancel by ***** ** https://www.yum2go.com/merchant/merchant-terms. **** one trial is available per Merchant store. We may change the ***** or ********** from **** to time **** advance notice. YUM2** will provide *** with notice via ***** of ******** changes *** when those ******* **** go into effect.</p>
<p><br></p>
<p><strong>MERCHANT ***** OF USE</strong></p>
<p><br></p>
<p>BEFORE&nbsp;YOU&nbsp;PARTICIPATE&nbsp;IN&nbsp;THE&nbsp;PROGRAM(S)&nbsp;OPERATED&nbsp;BY&nbsp;YUM2GO,&nbsp;INC.&nbsp;(&ldquo;YUM2GO&rdquo;)&nbsp;THAT&nbsp;ARE&nbsp;COVERED&nbsp;BY&nbsp;THESE&nbsp;YUM2GO&nbsp;MERCHANT&nbsp;TERMS&nbsp;OF USE&nbsp;(&ldquo;MERCHANT&nbsp;TERMS&rdquo;&nbsp;OR&nbsp;&ldquo;TERMS&rdquo;),&nbsp;PLEASE&nbsp;READ&nbsp;THESE&nbsp;TERMS&nbsp;CAREFULLY.&nbsp;BY&nbsp;EXECUTING&nbsp;THE&nbsp;SIGN-UP&nbsp;SHEET&nbsp;WITH&nbsp;YUM2GO&nbsp;OR&nbsp;OTHERWISE&nbsp;AGREEING&nbsp;TO&nbsp;THESE&nbsp;TERMS,&nbsp;INCLUDING&nbsp;THROUGH&nbsp;AN&nbsp;AUTHORIZED&nbsp;YUM2GO&nbsp;PARTNER,&nbsp;YOU&nbsp;OR&nbsp;THE&nbsp;ENTITY THAT&nbsp;YOU&nbsp;REPRESENT&nbsp;AGREE&nbsp;ON&nbsp;BEHALF&nbsp;OF&nbsp;ALL&nbsp;PARTICIPATING&nbsp;RESTAURANT&nbsp;LOCATIONS&nbsp;TO&nbsp;BE&nbsp;BOUND&nbsp;BY THESE TERMS TO THE EXCLUSION OF ALL OTHER TERMS.</p>
<p><br></p>
<p>THIS&nbsp;AGREEMENT&nbsp;CONTAINS&nbsp;PROVISIONS&nbsp;THAT&nbsp;GOVERN&nbsp;HOW&nbsp;CLAIMS&nbsp;THAT&nbsp;MAY ARISE ******* PARTIES&nbsp;ARE&nbsp;RESOLVED,&nbsp;INCLUDING,&nbsp;WITHOUT LIMITATION, ANY&nbsp;CLAIMS&nbsp;THAT&nbsp;AROSE OR WERE&nbsp;ASSERTED&nbsp;BEFORE&nbsp;THE&nbsp;EFFECTIVE&nbsp;DATE&nbsp;OF&nbsp;THIS&nbsp;AGREEMENT.&nbsp;IN&nbsp;PARTICULAR,&nbsp;SECTION&nbsp;17&nbsp;SETS&nbsp;FORTH *** *********** AGREEMENT WHICH&nbsp;WILL,&nbsp;WITH&nbsp;LIMITED&nbsp;EXCEPTIONS,&nbsp;REQUIRE&nbsp;DISPUTES&nbsp;BETWEEN&nbsp;US&nbsp;TO&nbsp;** SUBMITTED TO BINDING AND FINAL ARBITRATION.</p>
<p><br></p>
<p>UNLESS&nbsp;YOU&nbsp;OPT&nbsp;OUT&nbsp;OF&nbsp;THE&nbsp;ARBITRATION&nbsp;AGREEMENT:&nbsp;(1)&nbsp;YOU&nbsp;WILL&nbsp;ONLY&nbsp;BE&nbsp;PERMITTED&nbsp;TO&nbsp;PURSUE CLAIMS&nbsp;AND&nbsp;SEEK&nbsp;****** AGAINST YUM2GO&nbsp;** AN INDIVIDUAL BASIS, NOT AS&nbsp;A PLAINTIFF OR CLASS MEMBER&nbsp;IN ANY&nbsp;CLASS&nbsp;** REPRESENTATIVE&nbsp;ACTION&nbsp;OR&nbsp;PROCEEDING;&nbsp;AND&nbsp;(2) YOU&nbsp;ARE&nbsp;WAIVING YOUR&nbsp;RIGHT&nbsp;TO&nbsp;SEEK&nbsp;RELIEF&nbsp;IN&nbsp;A&nbsp;COURT&nbsp;OF&nbsp;LAW&nbsp;AND&nbsp;BEFORE&nbsp;A&nbsp;JURY.&nbsp;THE&nbsp;ARBITRATION&nbsp;AGREEMENT&nbsp;***** AFFECT&nbsp;YOUR&nbsp;RIGHT&nbsp;TO&nbsp;PARTICIPATE&nbsp;IN&nbsp;PENDING OR&nbsp;PROPOSED&nbsp;***** ACTION&nbsp;LITIGATION. PLEASE&nbsp;SEE&nbsp;SECTION&nbsp;17&nbsp;FOR&nbsp;MORE&nbsp;INFORMATION&nbsp;REGARDING&nbsp;THE&nbsp;ARBITRATION&nbsp;AGREEMENT,&nbsp;THE&nbsp;POSSIBLE EFFECTS&nbsp;OF&nbsp;THE&nbsp;ARBITRATION AGREEMENT&nbsp;AND&nbsp;HOW&nbsp;TO&nbsp;OPT&nbsp;OUT OF THE&nbsp;*********** AGREEMENT.</p>
<p><br></p>
<p><br></p>
<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; DEFINITIONS</strong></p>
<p><strong>&nbsp; &nbsp; &bull; &nbsp; &nbsp;&ldquo;Driver&rdquo;</strong> ***** third-party delivery contractor.</p>
<p><strong>&nbsp; &nbsp; &bull; &nbsp; &nbsp;&ldquo;Delivery</strong><strong>&nbsp;</strong><strong>API&rdquo;</strong><strong>&nbsp;</strong>means the YUM2** *********** programming interface (API) that allows the Merchant to exchange &nbsp; &nbsp; &nbsp; &nbsp; information **** YUM2GO.</p>
<p><strong>&nbsp; &nbsp; &bull; &nbsp; &nbsp;&ldquo;YUM2GO</strong><strong>&nbsp;</strong><strong>Data&rdquo;</strong><strong>&nbsp;</strong>shall mean any *********** **** YUM2GO provides or ***** ********** to ******** through the &nbsp; &nbsp; &nbsp; &nbsp; YUM2GO Platform, including without ********** Personal Information.</p>
<p><strong>&nbsp; &nbsp; &bull; &nbsp; &nbsp;&ldquo;YUM2GO</strong><strong>&nbsp;</strong><strong>Customer&rdquo;</strong><strong>&nbsp;</strong>means&nbsp;a&nbsp;customer *** places&nbsp;an&nbsp;order&nbsp;through&nbsp;the&nbsp;YUM2GO Platform.</p>
<p><strong>&nbsp; &nbsp; &bull; &nbsp; &nbsp;&ldquo;YUM2GO</strong><strong>&nbsp;</strong><strong>Platform&rdquo;</strong><strong>&nbsp;</strong>means the ****** ordering platform ***** ********* *** place ** order for Merchant &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Products *** the YUM2** website ** mobile application.</p>
<p><strong>&nbsp; &nbsp; &bull; &nbsp; &nbsp;&ldquo;YUM2GO Delivers&rdquo;&nbsp;</strong>means the service that ******* delivery fulfillment *** ****** placed ******** with the Merchant &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; by a ******** Customer.</p>
<p>&nbsp; &nbsp; &bull; &nbsp; &nbsp;<strong>&ldquo;YUM2GO Direct&rdquo;&nbsp;</strong>means *** service that ****** Customers to **** up orders placed through the YUM2GO Platform &nbsp; &nbsp; &nbsp; &nbsp; directly **** the Merchant. &nbsp;</p>
<p><strong>&nbsp; &nbsp; &bull; &nbsp; &nbsp;&ldquo;YUM2GO</strong><strong>&nbsp;</strong><strong>Services&rdquo;</strong><strong>&nbsp;</strong>means&nbsp;YUM2GO&nbsp;Platform,&nbsp;YUM2GO&nbsp;Delivers&nbsp;and YUM2** Direct,&nbsp;as&nbsp;applicable.</p>
<p><strong>&nbsp; &nbsp; &bull; &nbsp; &nbsp;&ldquo;YUM2** Delivers</strong><strong>&nbsp;</strong><strong>Orders&rdquo;</strong><strong>&nbsp;</strong>means ****** placed by Merchant for delivery fulfillment ******* the YUM2GO ******** &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; program.</p>
<p><strong>&nbsp; &nbsp; &bull; &nbsp; &nbsp;&ldquo;YUM2** Delivers</strong><strong>&nbsp;</strong><strong>Term&rdquo;</strong><strong>&nbsp;</strong>means&nbsp;the&nbsp;term&nbsp;of&nbsp;the&nbsp;agreement&nbsp;between&nbsp;YUM2GO&nbsp;and&nbsp;Merchant&nbsp;for&nbsp;YUM2GO&nbsp;Delivers.</p>
<p><strong>&nbsp; &nbsp; &bull; &nbsp; &nbsp;&ldquo;Platform</strong><strong>&nbsp;</strong><strong>Orders&rdquo;</strong><strong>&nbsp;</strong>***** orders for Merchant Products ****** through the YUM2GO ******** by YUM2GO &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Customers.</p>
<p><strong>&nbsp; &nbsp; &bull; &nbsp; &nbsp;&ldquo;Merchant&rdquo;</strong><strong>&nbsp;</strong>means the restaurant or ***** entity that has entered into an agreement with YUM2** to *** YUM2GO &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Services.</p>
<p><strong>&nbsp; &nbsp; &bull; &nbsp; &nbsp;&ldquo;******** Customer&rdquo;&nbsp;</strong>means a customer who places an ***** ******** **** *** ******** that **** ** ********* &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ******* *** YUM2GO Delivers program.</p>
<p><strong>&nbsp; &nbsp; &bull; &nbsp; &nbsp;&ldquo;Merchant</strong><strong>&nbsp;</strong><strong>Products&rdquo;</strong><strong>&nbsp;</strong>means&nbsp;all&nbsp;products&nbsp;offered&nbsp;for&nbsp;take-out&nbsp;or&nbsp;delivery&nbsp;orders&nbsp;at&nbsp;Merchant Stores.</p>
<p><strong>&nbsp; &nbsp; &bull; &nbsp; &nbsp;&ldquo;Merchant</strong><strong>&nbsp;</strong><strong>Stores&rdquo;</strong><strong>&nbsp;</strong>means the Merchant ********** ********* **** are within *** then-******* territory ******** ** &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; YUM2GO and that **** elected to *********** in the YUM2GO Services. Participating ********* *** be amended with &nbsp; &nbsp; &nbsp; &nbsp; written notice.</p>
<p><strong>&nbsp; &nbsp; &bull; &nbsp; &nbsp;&ldquo;Platform</strong><strong>&nbsp;</strong><strong>Term&rdquo;&nbsp;</strong>means&nbsp;the&nbsp;term&nbsp;of&nbsp;the&nbsp;agreement&nbsp;between&nbsp;YUM2GO&nbsp;and&nbsp;Merchant&nbsp;for&nbsp;the&nbsp;YUM2GO Platform.</p>
<p><strong>&nbsp; &nbsp; &bull; &nbsp; &nbsp;&ldquo;YUM2GO Direct</strong><strong>&nbsp;</strong><strong>Term&rdquo;</strong><strong>&nbsp;</strong>means the term of the ********* between YUM2GO and Merchant for theYUM2GO ****** &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; program.</p>
<p><strong>&nbsp; &nbsp; &bull; &nbsp; &nbsp;&ldquo;Personal Information&rdquo;&nbsp;</strong>shall **** any *********** ********* under **** Agreement that (i) ********** ** can ** used &nbsp; &nbsp; &nbsp; &nbsp; to identify an individual (including ******* limitation, names, ********* numbers, addresses, signatures, email &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; addresses or other ****** identifiers); or (ii) that can reasonably ** used to authenticate an ********** (including &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; without limitation, name, ******* information, precise location information, access, credentials, ********** *********** and &nbsp; &nbsp; &nbsp; &nbsp; any information that may ** considered &lsquo;personal data&rsquo; ** &lsquo;personal information&rsquo; ***** applicable law.</p>
<p><strong>&nbsp; &nbsp; &bull; &nbsp; &nbsp;&ldquo;Schedule</strong><strong>&nbsp;</strong><strong>for</strong><strong>&nbsp;</strong><strong>Later</strong><strong>&nbsp;</strong><strong>Order&rdquo;</strong><strong>&nbsp;</strong>shall&nbsp;mean&nbsp;an&nbsp;order&nbsp;to&nbsp;be fulfilled&nbsp;at&nbsp;a&nbsp;time&nbsp;later&nbsp;in&nbsp;the&nbsp;day or later.</p>
<p><strong>&nbsp; &nbsp; &bull; &nbsp; &nbsp;&ldquo;***** Party Platform&rdquo;&nbsp;</strong>means a technology interface, such ** a middleware technology platform, other than *** &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; online order form and the ******** API **** ******* ******** ** request delivery fulfillment and provide *********** &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ********* ** enable such delivery fulfillment.</p>
<p><br></p>
<p><br></p>
<p><strong>YUM2GO ******** RESPONSIBILITIES</strong></p>
<p>****** the term of this agreement, YUM2GO and Merchant shall ***** ** carry *** &nbsp;the following responsibilities:</p>
<p><br></p>
<p>YUM2GO&nbsp;Responsibilities</p>
<p>&nbsp; &nbsp; YUM2GO will, in a timely manner:</p>
<p>&bull; &nbsp; &nbsp;******* Merchant&rsquo;s logo; a listing of participating Merchant Stores; and a menu of all Merchant Products.</p>
<p>&bull; &nbsp; &nbsp;Accept YUM2GO Platform Orders **** YUM2** Customers for Merchant Products.</p>
<p>&bull; &nbsp; &nbsp;Forward each ******** ***** to the relevant Merchant Store; and</p>
<p>&bull; &nbsp; &nbsp;Forward each Platform Order to a Driver, so that the Driver can pick up *** applicable ******** Product(s) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; from the ******** ***** to deliver to the YUM2GO Customer.</p>
<p><br></p>
<p>Merchant&nbsp;Responsibilities</p>
<p>&nbsp; &nbsp; ******** will, in a timely manner:</p>
<p>&bull; &nbsp; &nbsp;Provide YUM2GO **** *** Merchant&rsquo;s in-store or take-out menu, including the price of each item on **** menu.</p>
<p>&bull; &nbsp; &nbsp;******* Merchant&rsquo;s menu and store *********** on the YUM2GO Platform, promptly make updates via *** &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Merchant portal to ******* the most up-to-**** products, ******* and other information or *********** notify &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; YUM2GO of any ****** ** ******* ** writing.</p>
<p>&bull; &nbsp; &nbsp;Accept all ******** Orders placed by YUM2GO Customers **** Merchant&rsquo;s current menu.</p>
<p>&bull; &nbsp; &nbsp;Confirm all ******** Orders from YUM2GO.</p>
<p>&bull; &nbsp; &nbsp;******* the ******** Products *** each Platform Order for pickup ** a ****** ** the designated time.</p>
<p>&bull; &nbsp; &nbsp;Process Platform Orders in the order in ***** they are received.</p>
<p>&bull; &nbsp; &nbsp;Notify YUM2** ** any ******* to the pricing, availability, description, or ***** ******** characteristics ** &nbsp; &nbsp; &nbsp; &nbsp; *** Merchant Products.</p>
<p>&bull; &nbsp; &nbsp;Notify YUM2GO of its **** and hours of operation; remain open *** business on the same days and ***** of &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; operation as Merchant&rsquo;s in-store business; ****** YUM2** of any changes to Merchant&rsquo;s hours of operations ** &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ******* *** state holidays; and ****** YUM2GO in ******* ** ******** closes ******* ** plans to close earlier **** &nbsp; &nbsp; &nbsp; &nbsp; Merchant&rsquo;s standard hours ** operation.</p>
<p>&bull; &nbsp; &nbsp;Notify all Merchant store staff ******* ** *** ************ with YUM2GO immediately upon execution ** this &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Agreement; and</p>
<p>&bull; &nbsp; &nbsp;Provide the **** utensils, napkins, bags, and ***** materials that ******** would typically provide in a &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; standard take-*** or delivery order, ******* ** Section 13(3)(i).</p>
<p><br></p>
<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; YUM2GO DELIVERS ******* RESPONSIBILITIES</strong></p>
<p>&nbsp; &nbsp; YUM2GO Responsibilities</p>
<p>&nbsp; &nbsp; YUM2GO will, in a timely manner:</p>
<p>&bull; &nbsp; &nbsp;******* Merchant **** an online order **** or access to the Delivery API to submit requests for deliveries ** ******* &nbsp; &nbsp; &nbsp; &nbsp; information through a Third-***** Platform.</p>
<p>&bull; &nbsp; &nbsp;Forward ******** to a Driver, so that the Driver can pick up the ********** Merchant Product(s) from *** Merchant &nbsp; &nbsp; &nbsp; &nbsp; Store to ******* to the ******** Customer.</p>
<p><br></p>
<p>Merchant&nbsp;Responsibilities</p>
<p>&nbsp; &nbsp; Merchant will, ** a timely manner:</p>
<p>&bull; &nbsp; &nbsp;Via the ****** order form, the ******** API, ** a Third-***** Platform, Merchant will provide information requested by &nbsp; &nbsp; &nbsp; &nbsp; YUM2** including the Merchant Customer&rsquo;s address, contact information, *** *** ******* instructions ******** for &nbsp; &nbsp; &nbsp; &nbsp; delivery.</p>
<p>&bull; &nbsp; &nbsp;Accept and ******* payments from ******** Customers *** their respective orders.</p>
<p>&bull; &nbsp; &nbsp;******** will notify Merchant Customers ***** to placing a YUM2** ******** ***** that their telephone numbers and ***** &nbsp; &nbsp; ******** contact information **** ** ****** with YUM2GO to enable deliveries to ** **** by ******* and, in connection &nbsp; &nbsp; &nbsp; &nbsp; with the ********** deliveries, request the ******** Customer&rsquo;s ******* to ******* delivery status updates ** e-mail, **** &nbsp; &nbsp; &nbsp; &nbsp; messages, and telephone calls from YUM2** *** Drivers; and</p>
<p>&bull; &nbsp; &nbsp;Merchant will ****** YUM2** ** a Merchant Customer has not consented ** receive delivery ******* or has placed any &nbsp; &nbsp; ************ on types of delivery updates that *** Merchant ******** consents to ******* (e.g., no texts). Merchant &nbsp; &nbsp; &nbsp; &nbsp; ****** ******** to ********* **** ******** *** ***** confirmations from YUM2GO providing status ******* and &nbsp; &nbsp; &nbsp; &nbsp; ******** confirmations in connection **** **** delivery.</p>
<p><br></p>
<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; YUM2GO DELIVERS OPERATING PROCEDURES</strong></p>
<p><em>&bull; &nbsp; &nbsp;</em>Hours ** Operation</p>
<p>&nbsp; &nbsp; The pickup *** drop-off of deliveries will be scheduled to **** place during YUM2GO&rsquo;s ******** hours of availability, as &nbsp; &nbsp; *** be updated **** time to **** at YUM2GO&rsquo;s sole discretion. Merchant ****** ** abide by *** ********* standard &nbsp; &nbsp; &nbsp; &nbsp; procedures: (i) to notify YUM2GO ** any changes ** *** hours of operations on state or federal holidays with reasonable &nbsp; &nbsp; advance notice; and (ii) to ****** YUM2GO with ********** advance notice if a ******** location ****** ******* **** &nbsp; &nbsp; &nbsp; &nbsp; standard hours ** operation or plans ** close earlier **** standard hours of operation.</p>
<p><em>&bull; &nbsp; &nbsp;</em>Delivery&nbsp;Radius</p>
<p>&nbsp; &nbsp; YUM2GO **** **** accept ****** ** be delivered ****** a ******* ************* ******** ****** ***** ** either *** &nbsp; &nbsp; &nbsp; &nbsp; Merchant or the Customer location, which will be communicated to Merchant.</p>
<p><em>&bull; &nbsp; &nbsp;</em>Cancellations<em>&nbsp;</em></p>
<p>&nbsp; &nbsp; **** owed for any ****** ********* ****** twenty-four (24) ***** of a Schedule for Later delivery are non-refundable. If &nbsp; &nbsp; provided more **** two (2) hours&rsquo; notice, *** less than twenty-four (24) hours&rsquo; notice, YUM2** will make reasonable &nbsp; &nbsp; efforts ** accommodate changes. Fees owed for any ****** cancelled ***** a ****** *** ******** a delivery &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; opportunity will be non-refundable.</p>
<p><em>&bull; &nbsp; &nbsp;</em>Notification</p>
<p>&nbsp; &nbsp; Merchant agrees ** notify *** staff members ** ******** Stores ** Merchant&rsquo;s relationship with YUM2** prior ** &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; submitting *** delivery requests to YUM2GO.</p>
<p><br></p>
<p><strong>REFUNDS AND REORDERS</strong></p>
<p>&nbsp; &nbsp; Refunds and re-****** will ** addressed as follows for Merchants that **** agreed to participate in the YUM2GO Platform, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; YUM2** ******** or the YUM2GO Direct Program, ** applicable:</p>
<p><br></p>
<p>&bull; &nbsp; &nbsp;YUM2GO Platform Refunds. In the event **** YUM2GO, ** it&rsquo;s sole and reasonable discretion, has to issue a refund, credit or re-order on a Customer&rsquo;s order, Merchant will prepare the **** ** the same specifications as the original Order (in the **** of a re-order) and bear the full cost of that refund, credit ** re-order, ** applicable, unless the refund, credit or re-***** is *** ** the<em>&nbsp;</em>********** or misconduct of a ****** or a failure of &nbsp;the YUM2GO Platform.</p>
<p><br></p>
<p>&bull; &nbsp; &nbsp;YUM2GO Delivers Refunds. Merchant ************ and ****** **** YUM2GO shall be responsible **** *** ************ *** delivery of Merchant Product(s) to Merchant Customers, and, if applicable, ********* delivery status updates to Merchant Customers. Merchant ***** be solely responsible for *** customer complaints regarding Merchant Product(s), including ******* limitation, complaints ********* the nature, quality, content, number ** ********* of Merchant Product(s). Merchant agrees *** to refer any Merchant *** ******** complaints directly to YUM2GO. *** complaints regarding the timeliness ** quality ** a Driver&rsquo;s delivery service ***** be reported ** Merchant to YUM2GO. If the completion ** a Drive ***** is **** than 45 minutes late and due to the<em>&nbsp;</em>fault ** YUM2GO, YUM2GO will&nbsp;reimburse Merchant&nbsp;for&nbsp;*** or a portion of&nbsp;the delivery cost ** the applicable Drive Order. If Merchant ****** ** refund a Merchant End Customer for any reason, such&nbsp;election ***** *** obligate&nbsp;YUM2GO to&nbsp;provide a corresponding reimbursement to&nbsp;Merchant. If a&nbsp;Merchant&nbsp;Product&nbsp;has&nbsp;been&nbsp;visibly&nbsp;damaged&nbsp;with&nbsp;proof&nbsp;from&nbsp;customer,&nbsp;YUM2GO&nbsp;may&nbsp;reimburse&nbsp;Merchant<em>&nbsp;</em>for&nbsp;all&nbsp;or&nbsp;a&nbsp;portion&nbsp;of&nbsp;the&nbsp;order&nbsp;subtotal.&nbsp;For&nbsp;the&nbsp;purposes&nbsp;of&nbsp;this&nbsp;agreement,&nbsp;&ldquo;Merchant&nbsp;Product&rdquo;&nbsp;is&nbsp;*** actual&nbsp;food&nbsp;or&nbsp;beverage&nbsp;item,&nbsp;not&nbsp;the&nbsp;packaging that ******** the Merchant Product. ** no event shall YUM2GO&nbsp;be&nbsp;obligated&nbsp;to&nbsp;issue&nbsp;any&nbsp;refunds&nbsp;directly&nbsp;to Merchant&nbsp;End&nbsp;Customers.</p>
<p><br></p>
<p>&bull; &nbsp; &nbsp;YUM2** Direct Refunds. YUM2GO ***** ** responsible for customer ******* ****** ******** to *** ordering of Merchant Products *** ****** relating to aYUM2GO Customer&rsquo;s YUM2** account. *** other customer ****** or complaints will be Merchant&rsquo;s sole responsibility. If YUM2GO, ** it&rsquo;s sole discretion, must ***** a refund, credit or re-***** *** a Customer&rsquo;s Order, Merchant will ******* *** food to *** same specifications as *** ******** Pick-up Order (in the case ** a re-order) and bear the full **** ** **** refund, credit or re-order.</p>
<p><br></p>
<p>ORDER EQUIPMENT</p>
<p><br></p>
<p>With&nbsp;respect&nbsp;to&nbsp;the&nbsp;YUM2GO&nbsp;Platform,&nbsp;Merchant&nbsp;will&nbsp;install&nbsp;any&nbsp;equipment&nbsp;reasonably&nbsp;required&nbsp;by&nbsp;YUM2GO&nbsp;for Merchant&nbsp;to&nbsp;receive Orders (including, without limitation, a tablet, *** machine, ** other automated electronic means of receiving&nbsp;Orders)&nbsp;(&ldquo;Order&nbsp;Equipment&rdquo;).&nbsp;Any&nbsp;Order&nbsp;Equipment&nbsp;provided by&nbsp;YUM2GO&nbsp;will&nbsp;remain YUM2GO&rsquo;s&nbsp;sole&nbsp;******** and may be **** solely for purposes&nbsp;related to ********** Merchant&rsquo;s responsibilities under **** Agreement. Merchant **** inspect&nbsp;all&nbsp;hardware&nbsp;and&nbsp;shall&nbsp;notify&nbsp;YUM2GO&nbsp;in&nbsp;writing if&nbsp;any&nbsp;Order&nbsp;Equipment&nbsp;is missing&nbsp;** was&nbsp;damaged&nbsp;as&nbsp;soon&nbsp;as possible&nbsp;after&nbsp;discovering&nbsp;such&nbsp;damage.&nbsp;YUM2GO may&nbsp;restrict&nbsp;or&nbsp;rescind&nbsp;Merchant&rsquo;s&nbsp;right&nbsp;to&nbsp;use&nbsp;the&nbsp;YUM2GO Platform&nbsp;at&nbsp;any&nbsp;time.&nbsp;Merchant&nbsp;will&nbsp;be&nbsp;responsible&nbsp;for&nbsp;any&nbsp;damage&nbsp;to,&nbsp;or&nbsp;loss&nbsp;of&nbsp;any&nbsp;Order&nbsp;Equipment&nbsp;provided&nbsp;by&nbsp;YUM2GO (excluding&nbsp;ordinary&nbsp;wear&nbsp;and&nbsp;tear),&nbsp;which&nbsp;will&nbsp;be&nbsp;promptly&nbsp;reimbursed&nbsp;by&nbsp;Merchant&nbsp;(at&nbsp;the&nbsp;replacement&nbsp;cost&nbsp;thereof). YUM2GO may&nbsp;recover&nbsp;the&nbsp;replacement&nbsp;cost&nbsp;of&nbsp;damaged&nbsp;or&nbsp;lost&nbsp;Order&nbsp;Equipment&nbsp;by&nbsp;deducting&nbsp;such&nbsp;amount&nbsp;from weekly&nbsp;payments.</p>
<p><br></p>
<p><strong>PAYMENTS, **** *** TAXES</strong></p>
<p><br></p>
<p>Payment,&nbsp;fees,&nbsp;and&nbsp;taxes&nbsp;shall&nbsp;be&nbsp;addressed&nbsp;as&nbsp;follows&nbsp;for&nbsp;Merchants, as&nbsp;applicable:</p>
<p><br></p>
<p>&bull; &nbsp; &nbsp;YUM2** Platform</p>
<p>&nbsp; &nbsp; &nbsp; &nbsp; YUM2GO **** *** *** ******** Orders prepared by Merchant each week on a ********** *** of the week, subject ** change with no **** than 10 days&rsquo; ****** to ********* by email or ******* notification, if YUM2** shall ** ******** to deduct from **** ******* the Subscription Fee ** all Platform Orders. If Merchant *** opted *** a <em>POS</em><em>&nbsp;</em><em>subscription</em>, YUM2** **** also deduct a weekly fee, as *** ***** on the *********** agreement for that service. For the avoidance ** doubt, YUM2GO will be entitled to a weekly Subscription Fee *** *** Platform Orders ** *** rate agreed upon and YUM2** may also elect, ** it&rsquo;s **** discretion, to ****** &nbsp; ******** fees, including but not limited ** a ******** Fee and/or Service Fee, **** Fee, Cancellation Fees, etc., as well as ** ********** markup for Merchant Products. Merchant ***** ** *********** for all taxes, duties, and ***** governmental charges on the **** of Merchant Products under this Agreement and remitting such taxes, duties, *** other governmental charges to the appropriate authorities.&nbsp;</p>
<p><br></p>
<p>&nbsp; &nbsp; &bull; &nbsp; &nbsp;Payment Processing</p>
<p>&nbsp; &nbsp; &nbsp; &nbsp; Payment ********** services for ********* on *** YUM2GO ******** are ******** by ****** and *** subject ** the Stripe Connected Account Agreement, which includes the Stripe Services Agreement. ** agreeing to *** terms of this contract, Merchant agrees to be ***** by *** Stripe Connected Account ********* and the Stripe Services Agreement, as *** same *** ** modified by Stripe from time to time. As a condition ** YUM2** enabling payment processing ******** ******* Stripe, Merchant ****** to provide YUM2GO accurate and ******** *********** ***** Merchant&rsquo;s ******** and representatives, ** applicable, *** ******** authorizes YUM2** to share that information *** transaction information ******* ** Merchant&rsquo;s use of the payment ********** ******** ******** by Stripe for reporting purposes. ****** *** been audited by a PCI-********* auditor and is certified ** PCI Service Provider ***** 1.</p>
<p><br></p>
<p><strong>INTELLECTUAL PROPERTY</strong></p>
<p><br></p>
<p>&nbsp; &nbsp; Merchant Content and Trademark; Photographs of Menu Items.</p>
<p>&bull; &nbsp; &nbsp;****** the the term ** **** agreement, ******** grants to YUM2GO royalty-free, non-exclusive, limited, revocable, non-transferable,<em>&nbsp;</em>non-sub-licensable<em>&nbsp;</em>rights&nbsp;and&nbsp;licenses&nbsp;to&nbsp;use&nbsp;and&nbsp;display ******** Content in the&nbsp;provision of&nbsp;providing&nbsp;services&nbsp;to&nbsp;Merchant.&nbsp;As&nbsp;used&nbsp;herein,&nbsp;&ldquo;Merchant Content&rdquo; includes, ******* limitation, menus,&nbsp;*********** (****** provided ** Merchant or ******* on Merchant&rsquo;s website),&nbsp;trademarks, logos&nbsp;*** ***** ********* ******** by&nbsp;Merchant&nbsp;to YUM2GO.</p>
<p>&bull; &nbsp; &nbsp;If *********** of Merchant&rsquo;s **** items are *** available or if **** do not **** YUM2GO requirements, as reasonably determined by YUM2GO, ******** may contract with YUM2GO ** have ************ photography services made ********* to Merchant.</p>
<p>&bull; &nbsp; &nbsp;Requests to remove representations ** Merchant&rsquo;s menu items may be made ** contacting YUM2** support and requests will ** carried *** in a timely manner.</p>
<p><br></p>
<p>&nbsp; &nbsp; <strong>************ INFORMATION</strong></p>
<p><br></p>
<p>The&nbsp;term&nbsp;&ldquo;Confidential&nbsp;Information&rdquo; ***** mean&nbsp;any confidential or&nbsp;proprietary&nbsp;business,&nbsp;********* ** financial&nbsp;information&nbsp;or ********* of&nbsp;a party&nbsp;(&ldquo;********** Party&rdquo;) provided&nbsp;to&nbsp;*** other party (&ldquo;Receiving Party&rdquo;) ** ********** with&nbsp;this&nbsp;Agreement,&nbsp;whether&nbsp;orally&nbsp;or in&nbsp;physical&nbsp;form,&nbsp;and&nbsp;shall&nbsp;include&nbsp;the&nbsp;terms&nbsp;of&nbsp;this Agreement.&nbsp;Without&nbsp;limiting&nbsp;the&nbsp;foregoing,&nbsp;YUM2GO&nbsp;Data&nbsp;is&nbsp;the&nbsp;Confidential&nbsp;Information&nbsp;of&nbsp;YUM2GO.</p>
<p><br></p>
<p>&bull; &nbsp; &nbsp;Confidential Information **** not include information that: (i) *** rightfully known ** the ********* Party without restriction on use or disclosure ***** to **** information&rsquo;s being disclosed ** the Receiving Party in connection **** **** Agreement; (ii) was or <em>becomes ****** domain</em> other **** ** the fault ** *** Receiving Party; (iii) *** ** is received by *** Receiving ***** ** a non-confidential ***** from a third party that, to the Receiving Party&rsquo;s knowledge, was *** at the time under *** ********** to maintain *** confidentiality; ** (iv) *** Receiving Party can demonstrate by documentary records *** independently developed ** the Receiving ***** without access to, use ** ** reference to any ************ Information.</p>
<p><br></p>
<p>&bull; &nbsp; &nbsp;The Receiving ***** shall: (i) not access or use Confidential Information other **** as ********* to ******** *** rights ** perform its obligations in ********** with **** Agreement; (ii) except subject to *** compliance with ******* 9(d), not disclose or permit access ** Confidential Information other **** to its or any of *** employees, officers, directors, consultants, agents, independent contractors, service providers, ************** and ***** advisors (&ldquo;Representatives&rdquo;) who **** ** **** **** ************ Information *** purposes of the Receiving Party&rsquo;s ******** of *** rights or performance ** its obligations under and in accordance with this Agreement, *** prior ** any such disclosure are ***** ** written confidentiality and restricted use obligations at ***** as ********** ** *** Confidential Information as the terms set ***** in this Section; *** (iii) safeguard the Confidential Information from ************ use, access or disclosure using at least the ****** of care ** **** to protect its most/similarly sensitive information and in no event **** than a reasonable degree of care.</p>
<p><br></p>
<p>&bull; &nbsp; &nbsp;If the Receiving Party is ********* by ********** Law to disclose any Confidential Information then, to the extent ********* by applicable Law, the Receiving Party ***** promptly notify the ********** ***** ** writing ** **** requirement ** **** the Disclosing Party can seek a ********** ***** ** other remedy or waive its ****** under ******* 9(c) and provide ********** assistance ** *** Disclosing Party, at the Disclosing Party&rsquo;s sole expense, in opposing or seeking ********** limitations on disclosure.</p>
<p><br></p>
<p>&nbsp; &nbsp; <strong>DATA SECURITY AND PRIVACY</strong></p>
<p><br></p>
<p>&bull; &nbsp; &nbsp;General</p>
<p>Merchant agrees *** to&nbsp;access,&nbsp;collect, store,&nbsp;retain,&nbsp;transfer, *** ** ********* process in&nbsp;any manner YUM2GO&nbsp;Data, including without limitation Personal Information, ****** as required to perform under&nbsp;this&nbsp;Agreement.&nbsp;Merchant&nbsp;***** keep YUM2** **** secure&nbsp;from unauthorized access&nbsp;and maintain the&nbsp;accuracy&nbsp;and&nbsp;integrity&nbsp;of&nbsp;YUM2GO&nbsp;Data&nbsp;** Merchant&rsquo;s custody ** control ** using appropriate organizational,&nbsp;physical,&nbsp;and&nbsp;technical&nbsp;safeguards.&nbsp;If&nbsp;Merchant&nbsp;******* ***** of any unauthorized ****** to&nbsp;YUM2** Data, Merchant will&nbsp;immediately notify YUM2GO,&nbsp;consult, and&nbsp;********* **** ************** *** potentially required notices, *** provide *** information reasonably requested by&nbsp;YUM2GO. Merchant agrees to implement and *** ******** procedures, protocols ** access credentials ** reasonably&nbsp;requested by&nbsp;YUM2GO&nbsp;and&nbsp;**** be&nbsp;responsible for&nbsp;damages&nbsp;resulting&nbsp;from&nbsp;Merchant&rsquo;s&nbsp;failure&nbsp;to comply.&nbsp;Merchant will&nbsp;not allow&nbsp;any&nbsp;***** party&nbsp;to&nbsp;use the&nbsp;YUM2GO&nbsp;Platform;&nbsp;copy, modify,&nbsp;rent,&nbsp;lease,&nbsp;sell, distribute, reverse engineer or&nbsp;otherwise attempt ** gain access to the source **** of the YUM2GO Platform; damage, destroy or impede the services&nbsp;provided ******* the YUM2GO Platform; transmit injurious&nbsp;code;&nbsp;or&nbsp;bypass&nbsp;or&nbsp;breach&nbsp;any&nbsp;security&nbsp;protection&nbsp;on&nbsp;*** YUM2GO Platform.</p>
<p><br></p>
<p>&bull; &nbsp; &nbsp;******** API</p>
<p>During the **** ** this Agreement, YUM2GO grants to Merchant a non-exclusive, royalty-free, non-&nbsp;assignable,&nbsp;non-&nbsp;transferable, non-sub-licensable, revocable, limited, fully paid-up ******* to ****** the Delivery&nbsp;API&nbsp;solely&nbsp;to&nbsp;transmit&nbsp;information&nbsp;to&nbsp;facilitate&nbsp;the&nbsp;YUM2GO&nbsp;Drive&nbsp;services.&nbsp;Merchant&nbsp;will&nbsp;not&nbsp;and will not ****** or authorize any third party to (i) sell, license, rent, resell, lease, assign (except as permitted herein), transfer, or otherwise ************ exploit&nbsp;the&nbsp;Delivery API; (ii) ********** or disable *** security ** other technological&nbsp;features ** measures of, or otherwise gain or&nbsp;attempt&nbsp;to&nbsp;gain&nbsp;unauthorized&nbsp;access&nbsp;to&nbsp;the&nbsp;Delivery&nbsp;API;&nbsp;(iii)&nbsp;reverse&nbsp;engineer,&nbsp;dissemble, decompile,&nbsp;or&nbsp;otherwise&nbsp;attempt&nbsp;to&nbsp;derive&nbsp;the&nbsp;source&nbsp;code&nbsp;or&nbsp;the&nbsp;underlying&nbsp;ideas,&nbsp;algorithms,&nbsp;structure,&nbsp;or ************ of&nbsp;the Delivery&nbsp;API; (iv)&nbsp;use the&nbsp;Delivery API in any manner or *** any purpose **** violates *** law or regulation; and (v) use the Delivery *** for a reason&nbsp;***** than as&nbsp;************ ******** ** intended under this Agreement. Each Party agrees not to ******* *** ****** with the&nbsp;intent of introducing to *** ***** Party&rsquo;s systems, products, or services (********* the Delivery API) any&nbsp;viruses, worms,&nbsp;defect, ****** horses, malware, or any ***** ** a destructive nature.</p>
<p><br></p>
<p>&nbsp; &nbsp; &bull; &nbsp; &nbsp;Termination</p>
<p>&nbsp; &nbsp; &nbsp; &nbsp; Merchant *** terminate this agreement for any reason ** any time upon 30days prior written notice. YUM2** *** terminate this agreement for *** ****** ** any time **** written notice. Email ** acceptable for written notice. Neither Merchant *** YUM2GO will ** ******** to pay *** fee in connection with a termination by ****** party ** ** ****** to *** ***** as a ****** ** termination of **** Agreement for *** damages, *** *** loss of goodwill, *********** ******* or *********** income, ** on account of any expenditures, investments, ****** or *********** **** ** either Merchant or YUM2GO.</p>
<p><br></p>
<p>&nbsp; &nbsp; &bull; &nbsp; &nbsp;Modifications</p>
<p><br></p>
<p>&nbsp; &nbsp; &nbsp; &nbsp; YUM2GO ******** the right, at its **** discretion, to change, suspend, or discontinue *** ******** (including without limitation, the availability of any feature or content) at any time. YUM2** may, at *** sole discretion, ****** Merchant Products or ****** from the YUM2GO ******** if YUM2GO <em>reasonably</em> ********** that such Merchant ******* or Merchant ***** could subject YUM2GO ** <em>an&nbsp;</em>undue regulatory risk, health and safety risk, or other liability. YUM2GO also *** revise these Terms from time to time. The ******* will *** ** *********** *** the most current ******* ** *** terms <em>is</em> <em>available</em> ** https://www.yum2go.com/merchant/merchant-terms/. We will ****** Merchants of material revisions *** a ******* notification or ** email ** the email ******* associated with your account. By continuing to access ** use the Services ***** ***** revisions become effective, you agree to ** ***** ** the revised Terms.</p>
<p><br></p>
<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; REPRESENTATIONS AND WARRANTIES; ADDITIONAL WARRANTIES; WARRANTY DISCLAIMER</strong></p>
<p><br></p>
<p>&bull; &nbsp; &nbsp;Each ***** represents and warrants that it will comply **** all applicable laws and regulations in its performance of this Agreement, including without limitation (i) *** ********** data protection *** privacy laws, *** (ii) *** applicable laws related to ***** ***** intellectual property and other *********** rights.</p>
<p><br></p>
<p>&bull; &nbsp; &nbsp;Merchant ******* represents, ******** and agrees **** (i) it will ****** with *** applicable laws, rules, standards and *********** relating to licenses, health (including Proposition 65 in California), **** packaging and accessory items (including *** not ******* to food ware, plasticware, and other disposable restaurant supplies), and food safety *** sanitation, (ii) it has informed YUM2** of any required consumer-facing warnings, charges, opt-in requirements, and instructions associated with ******** Product(s) and ** will ****** YUM2** of any such warnings, charges, opt-ins, *** ************ **** become required in the future, (iii) it will disclose common allergens in *** Merchant&rsquo;s menu items listed on *** YUM2GO Platform, (iv) ** will *** include any age-********** products (including but *** limited to alcohol and tobacco) in Merchant&rsquo;s menus ** *** YUM2GO ******** or request delivery of any age- ********** products through the YUM2GO Platform without first ******** **** a separate ********* with YUM2** memorializing the promotion, sale and delivery of such ******** in ********** **** *** laws ** the ********** state ** which such ******** will be sold, (v) title to Merchant Products ********* from Merchant directly to the YUM2GO End Customer **** **** Merchant Product ****** the ******** possession of the Merchant, (vi) it will not disclose any *********** related to a Driver or a consumer to a third party (****** as ******** to comply with law or pursuant to a court order) and (vii) it will comply with its obligations under Section 2(b)(iii) and 2(b)(iv) of this Agreement.</p>
<p><br></p>
<p>&bull; &nbsp; &nbsp;****** AS EXPRESSLY SET FORTH HEREIN, TO THE EXTENT PERMITTED ** APPLICABLE LAW, YUM2GO, INC. ****** ********* DISCLAIMS ALL WARRANTIES, EXPRESS, IMPLIED OR STATUTORY, ********* THE YUM2** PLATFORM, THE DELIVERY API, EQUIPMENT OR SERVICES, INCLUDING BUT NOT LIMITED ** ANY IMPLIED WARRANTIES ** MERCHANTABILITY, TITLE, ************ QUALITY OR RESULTS, OR FITNESS FOR A ********** PURPOSE AND NON-INFRINGEMENT.&nbsp;</p>
<p><br></p>
<p>Merchant&nbsp;acknowledges that&nbsp;the&nbsp;operation of&nbsp;the&nbsp;Platform may&nbsp;from time&nbsp;to&nbsp;time&nbsp;encounter ********* or&nbsp;other problems&nbsp;*** may&nbsp;not *********** continue&nbsp;uninterrupted or&nbsp;without&nbsp;technical&nbsp;or&nbsp;other&nbsp;errors&nbsp;and YUM2GO ***** *** be&nbsp;responsible&nbsp;to&nbsp;******** or&nbsp;others&nbsp;for&nbsp;any&nbsp;such&nbsp;interruptions,&nbsp;errors,&nbsp;or&nbsp;problems&nbsp;or&nbsp;an&nbsp;outright discontinuance ** the ******** nor for any guarantee ** results **** ******* to the YUM2GO services contemplated&nbsp;herein. Both Parties acknowledge that ******* party has *** *********** ** *** received any assurances *** future&nbsp;business or that any&nbsp;investment by&nbsp;a party will&nbsp;be recovered or&nbsp;recouped&nbsp;** that such party will ****** *** anticipated&nbsp;amount of profits by virtue ** this Agreement.</p>
<p><br></p>
<p>&nbsp; &nbsp; &bull; &nbsp; &nbsp;Indemnification.</p>
<p>&nbsp; &nbsp; &nbsp; &nbsp; **** party (*** <strong>&ldquo;Indemnifying</strong><strong>&nbsp;</strong><strong>Party&rdquo;</strong>) will defend, indemnify, and hold harmless *** other party, its ************ and affiliates, and ***** ********** officers, directors, shareholders, employees, and ****** (the <strong>&ldquo;Indemnified Party&rdquo;</strong>) from and ******* any and all claims, damages, ****** and expenses (including reasonable attorney&rsquo;s fees) (collectively <strong>&ldquo;Losses&rdquo;</strong>) with ******* to *** third-party claims arising&nbsp;out&nbsp;** or&nbsp;related&nbsp;to:&nbsp;(i)&nbsp;any&nbsp;bodily&nbsp;injury&nbsp;(including&nbsp;death)&nbsp;or damage&nbsp;to&nbsp;tangible&nbsp;or&nbsp;real&nbsp;property&nbsp;to&nbsp;the&nbsp;extent&nbsp;caused&nbsp;by&nbsp;the&nbsp;Indemnifying Party&rsquo;s personnel&nbsp;and,&nbsp;in the&nbsp;case of&nbsp;YUM2GO,&nbsp;Drivers&nbsp;(or,&nbsp;in&nbsp;the&nbsp;case&nbsp;of&nbsp;Merchant&nbsp;as&nbsp;the&nbsp;Indemnifying&nbsp;Party,&nbsp;caused&nbsp;by&nbsp;the Merchant Products);&nbsp;(ii) any&nbsp;claims&nbsp;that the ************ ***** breached its representations,&nbsp;warranties ** ********* *** forth in&nbsp;Section ** and&nbsp;Section 13 of this Agreement;&nbsp;(iii)&nbsp;the&nbsp;violation&nbsp;of&nbsp;the&nbsp;intellectual&nbsp;property&nbsp;of&nbsp;the&nbsp;third&nbsp;party&nbsp;by&nbsp;the&nbsp;Indemnifying&nbsp;Party&rsquo;s&nbsp;logos,&nbsp;trademarks, trade names, menus, documentation, or other ************ ******** (collectively, &ldquo;Materials&rdquo;). ** addition, Merchant&nbsp;will defend,&nbsp;indemnify&nbsp;and&nbsp;hold&nbsp;harmless&nbsp;YUM2GO&nbsp;from&nbsp;any&nbsp;and&nbsp;all Losses&nbsp;related&nbsp;to&nbsp;any&nbsp;violation&nbsp;or&nbsp;alleged&nbsp;violation&nbsp;of any&nbsp;applicable&nbsp;retail&nbsp;food&nbsp;or&nbsp;other&nbsp;health&nbsp;and&nbsp;safety&nbsp;code,&nbsp;rule,&nbsp;or&nbsp;regulation&nbsp;related&nbsp;to&nbsp;Merchant&nbsp;Product(s),&nbsp;except&nbsp;to the&nbsp;extent&nbsp;such&nbsp;Losses&nbsp;were&nbsp;caused&nbsp;directly&nbsp;by&nbsp;the&nbsp;gross&nbsp;negligence&nbsp;or&nbsp;willful&nbsp;misconduct&nbsp;of&nbsp;YUM2GO.&nbsp;In&nbsp;each&nbsp;case the&nbsp;Indemnified&nbsp;Party&nbsp;shall&nbsp;provide&nbsp;the&nbsp;************ Party&nbsp;with&nbsp;(a)&nbsp;prompt&nbsp;notice&nbsp;of&nbsp;any&nbsp;claims&nbsp;such&nbsp;that&nbsp;the Indemnifying ***** is&nbsp;not ********** by&nbsp;any ***** of&nbsp;such&nbsp;notification,&nbsp;(b)&nbsp;the&nbsp;option&nbsp;to&nbsp;assume&nbsp;sole&nbsp;control&nbsp;over defense&nbsp;and&nbsp;settlement&nbsp;or&nbsp;********** of&nbsp;any&nbsp;claim,&nbsp;and&nbsp;(c)&nbsp;reasonable&nbsp;assistance in connection **** **** defense, settlement&nbsp;or litigation (at&nbsp;the&nbsp;Indemnifying Party&rsquo;s&nbsp;expense). The&nbsp;Indemnified Party&nbsp;*** participate&nbsp;in&nbsp;the&nbsp;defense, settlement&nbsp;or&nbsp;litigation&nbsp;** such a claim&nbsp;with&nbsp;counsel&nbsp;of its own&nbsp;choice&nbsp;and&nbsp;at *** own&nbsp;expense;&nbsp;however,&nbsp;the&nbsp;************ ***** ***** *** enter into any settlement agreement that imposes any obligation on the Indemnified ***** without the&nbsp;*********** Party&apos;s express prior written&nbsp;consent. YUM2GO ******* no&nbsp;liability, and&nbsp;shall&nbsp;**** no&nbsp;liability, *** any&nbsp;infringement claim&nbsp;pursuant&nbsp;to&nbsp;section&nbsp;14(iii)&nbsp;above based&nbsp;on&nbsp;Merchant&rsquo;s&nbsp;access&nbsp;to&nbsp;and/or&nbsp;use&nbsp;of&nbsp;the&nbsp;YUM2GO Platform&nbsp;following&nbsp;notice&nbsp;of such&nbsp;an&nbsp;infringement&nbsp;claim;&nbsp;any&nbsp;unauthorized modification&nbsp;of&nbsp;the&nbsp;YUM2GO&nbsp;Platform&nbsp;by Merchant;&nbsp;or&nbsp;Merchant&rsquo;s&nbsp;combination of&nbsp;the YUM2GO&nbsp;Platform with&nbsp;third party programs,&nbsp;services, data, hardware, or other&nbsp;materials&nbsp;which&nbsp;otherwise&nbsp;would&nbsp;not&nbsp;result&nbsp;in&nbsp;such&nbsp;infringement&nbsp;claim.</p>
<p><br></p>
<p>&nbsp; &nbsp; &bull; &nbsp; &nbsp;Limitation of Liability.</p>
<p>&nbsp; &nbsp; &nbsp; &nbsp; EXCEPT **** ******* TO DAMAGES ******* FROM VIOLATIONS ** LAW OR WILLFUL MISCONDUCT, ****** **** OWED BY MERCHANT IN ****** OF THE BELOW LIMIT, AND ******* PAYABLE TO THIRD PARTIES UNDER ******* 14 (INDEMNIFICATION), TO *** EXTENT ********* BY APPLICABLE LAW, (I) NEITHER PARTY **** BE LIABLE TO *** OTHER UNDER THIS AGREEMENT, FOR INDIRECT, SPECIAL, PUNITIVE, ** ************* DAMAGES, ** FOR LOST PROFITS, LOST REVENUES, **** TO GOODWILL, OR THE COSTS *** PROCURING REPLACEMENT SERVICES, WHETHER BASED ON TORT, CONTRACT OR ANY OTHER LEGAL THEORY, AND WHETHER ** NOT SUCH PARTY HAS BEEN ADVISED ** THE POSSIBILITY OF SUCH DAMAGES, *** (II) EACH PARTY&rsquo;S MAXIMUM AGGREGATE *********** RELATED TO OR IN ********** WITH THIS ********* SHALL *** EXCEED *** TOTAL AMOUNT PAID OR PAYABLE BY ONE ***** ** THE ***** ***** IN *** TWELVE (12) MONTH PERIOD IMMEDIATELY PRECEDING THE INCIDENT GIVING RISE TO THE LIABILITY. THE FOREGOING DISCLAIMER SHALL *** ***** ** THE EXTENT PROHIBITED BY LAW.</p>
<p><br></p>
<p>&nbsp; &nbsp; &bull; &nbsp; &nbsp;Insurance.</p>
<p>&nbsp; &nbsp; &nbsp; &nbsp; During *** term of the Agreement and for one **** after, **** party **** maintain adequate insurance in amounts *** **** than ** ******** ** law or that is ****** practice in such party&rsquo;s business. Upon request, **** party will provide the ***** with current evidence of coverage. Such ********* shall not be ******** or ********** reduced ******* thirty (30) **** prior ******* notice. ** no event ***** the limits of *** ********* policy be considered ** limiting the liability of a party under this Agreement.</p>
<p><br></p>
<p>&nbsp; &nbsp; &bull; &nbsp; &nbsp;Dispute Resolution.</p>
<p>PLEASE READ THE ********* SECTION CAREFULLY. ** REQUIRES YOU ** ARBITRATE ******** WITH THE&nbsp;COMPANY&nbsp;(YUM2GO)&nbsp;AND&nbsp;LIMITS&nbsp;THE&nbsp;MANNER&nbsp;IN&nbsp;WHICH&nbsp;YOU&nbsp;CAN&nbsp;SEEK&nbsp;RELIEF.&nbsp;THIS&nbsp;SECTION&nbsp;THIS&nbsp;AGREEMENT&nbsp;SHALL&nbsp;BE&nbsp;REFERRED&nbsp;TO&nbsp;AS&nbsp;THE&nbsp;&ldquo;ARBITRATION&nbsp;AGREEMENT&rdquo;.</p>
<p><br></p>
<p><strong>ARBITRATION AGREEMENT</strong></p>
<p><br></p>
<p>*** dispute, controversy&nbsp;or claim arising out of, relating to ** in connection&nbsp;**** this contract, including *** breach, *********** ** validity thereof, ***** be finally ******** by binding arbitration, ****** **** in&nbsp;court, except that (1) *** may assert claims in small claims court if your claims qualify, so **** as the matter ******* in&nbsp;such ***** *** advances **** ** an individual (non-class, non- representative)&nbsp;basis; *** (2) you&nbsp;** *** Company&nbsp;may&nbsp;seek equitable relief in court for infringement&nbsp;or other&nbsp;misuse&nbsp;of&nbsp;intellectual ******** rights&nbsp;(such as&nbsp;trademarks, trade&nbsp;dress, domain names, trade secrets, copyrights, and patents). **** *********** ********* shall apply, without limitation, ** all&nbsp;claims&nbsp;that&nbsp;arose&nbsp;** were&nbsp;******** before&nbsp;the&nbsp;Effective&nbsp;Date&nbsp;of&nbsp;this&nbsp;Agreement.</p>
<p><br></p>
<p>TO THE EXTENT **** ***** HAVE&nbsp;BEEN FILED&nbsp;AGAINST&nbsp;THE&nbsp;COMPANY&mdash;AND&nbsp;THAT&nbsp;OTHER&nbsp;CASES&nbsp;MAY&nbsp;BE&nbsp;FILED&nbsp;IN&nbsp;THE&nbsp;FUTURE&mdash;**** ATTEMPT&nbsp;TO&nbsp;ASSERT&nbsp;CLASS&nbsp;ACTION&nbsp;CLAIMS,&nbsp;BY&nbsp;ACCEPTING&nbsp;THIS&nbsp;ARBITRATION&nbsp;AGREEMENT&nbsp;YOU&nbsp;ELECT&nbsp;NOT&nbsp;TO&nbsp;PARTICIPATE&nbsp;IN&nbsp;SUCH&nbsp;CASES.&nbsp;IF&nbsp;YOU&nbsp;AGREE&nbsp;TO&nbsp;ARBITRATION&nbsp;WITH&nbsp;THE&nbsp;COMPANY,&nbsp;YOU ARE&nbsp;AGREEING&nbsp;IN&nbsp;ADVANCE&nbsp;THAT&nbsp;YOU&nbsp;WILL&nbsp;NOT&nbsp;PARTICIPATE&nbsp;IN&nbsp;OR&nbsp;SEEK&nbsp;TO&nbsp;RECOVER&nbsp;MONETARY&nbsp;OR&nbsp;OTHER&nbsp;RELIEF&nbsp;IN&nbsp;ANY&nbsp;SUCH&nbsp;CLASS,&nbsp;COLLECTIVE,&nbsp;AND/OR&nbsp;REPRESENTATIVE LAWSUIT.&nbsp;INSTEAD,&nbsp;BY AGREEING&nbsp;TO&nbsp;ARBITRATION,&nbsp;YOU&nbsp;MAY&nbsp;BRING&nbsp;YOUR&nbsp;CLAIMS&nbsp;AGAINST&nbsp;*** COMPANY&nbsp;IN&nbsp;AN&nbsp;INDIVIDUAL&nbsp;ARBITRATION&nbsp;PROCEEDING.&nbsp;** SUCCESSFUL&nbsp;ON&nbsp;SUCH CLAIMS, YOU&nbsp;COULD&nbsp;BE&nbsp;AWARDED&nbsp;MONEY&nbsp;OR OTHER&nbsp;RELIEF&nbsp;BY&nbsp;AN&nbsp;ARBITRATOR.</p>
<p><br></p>
<p><strong>&bull; &nbsp; &nbsp;*********** Rules and Forum.</strong><strong>&nbsp;</strong>This *********** ********* is governed by the ******* Arbitration Act ** all respects. To &nbsp; &nbsp; &nbsp; &nbsp; begin an arbitration proceeding, you **** **** a letter ********** arbitration *** describing your claim to YUM2GO&rsquo;s &nbsp; &nbsp; &nbsp; &nbsp; registered agent. *** may choose to have the arbitration ********* ** telephone, ***** conference, ***** on ******* &nbsp; &nbsp; &nbsp; &nbsp; submissions, or in person in the country where you **** ** ** another mutually ****** location.</p>
<p><br></p>
<p><strong>&bull; &nbsp; &nbsp;Arbitrator</strong><strong>&nbsp;</strong><strong>Authority.</strong><strong>&nbsp;</strong>The arbitrator, and *** any federal, state, or local ***** ** agency, shall **** ********* authority to&nbsp;resolve&nbsp;any&nbsp;dispute&nbsp;relating&nbsp;to&nbsp;the&nbsp;interpretation,&nbsp;applicability,&nbsp;enforceability&nbsp;or formation&nbsp;of&nbsp;this&nbsp;Arbitration&nbsp;Agreement&nbsp;including,&nbsp;but&nbsp;not&nbsp;limited&nbsp;to&nbsp;any&nbsp;claim&nbsp;that&nbsp;all&nbsp;or&nbsp;any&nbsp;part&nbsp;of&nbsp;this Arbitration&nbsp;Agreement&nbsp;is&nbsp;void&nbsp;or&nbsp;voidable.&nbsp;The&nbsp;arbitration&nbsp;will&nbsp;decide&nbsp;the&nbsp;rights&nbsp;and&nbsp;liabilities,&nbsp;if&nbsp;any,&nbsp;of&nbsp;you and&nbsp;YUM2GO.&nbsp;The&nbsp;arbitration&nbsp;proceeding&nbsp;will&nbsp;not&nbsp;be&nbsp;consolidated&nbsp;with&nbsp;any&nbsp;other&nbsp;matters or&nbsp;joined&nbsp;**** any&nbsp;other&nbsp;proceedings&nbsp;or&nbsp;parties.&nbsp;The&nbsp;arbitrator&nbsp;will&nbsp;have&nbsp;the&nbsp;authority&nbsp;to&nbsp;grant&nbsp;motions&nbsp;*********** of&nbsp;all or&nbsp;part&nbsp;of&nbsp;any&nbsp;***** or&nbsp;dispute. The&nbsp;********** will&nbsp;have&nbsp;the&nbsp;authority to&nbsp;***** monetary&nbsp;damages *** to ***** any non-monetary remedy or ****** ********* to an ********** under applicable law, *** arbitral&nbsp;forum&rsquo;s rules,&nbsp;and&nbsp;this&nbsp;Agreement&nbsp;(including&nbsp;this&nbsp;Arbitration&nbsp;Agreement).&nbsp;The&nbsp;arbitrator&nbsp;will&nbsp;issue&nbsp;a&nbsp;written ********* of&nbsp;decision&nbsp;describing&nbsp;the&nbsp;essential&nbsp;findings&nbsp;and&nbsp;conclusions&nbsp;** which&nbsp;any&nbsp;award&nbsp;(or decision not&nbsp;to&nbsp;render&nbsp;an&nbsp;award)&nbsp;is&nbsp;based,&nbsp;including&nbsp;the&nbsp;calculation&nbsp;of&nbsp;any&nbsp;damages&nbsp;awarded.&nbsp;The&nbsp;arbitrator&nbsp;shall follow&nbsp;the&nbsp;applicable&nbsp;law.&nbsp;The&nbsp;arbitrator&nbsp;has&nbsp;the&nbsp;same&nbsp;authority&nbsp;to&nbsp;award&nbsp;relief&nbsp;on&nbsp;an&nbsp;individual&nbsp;basis&nbsp;that&nbsp;a ***** in&nbsp;a&nbsp;court of&nbsp;law&nbsp;***** have.&nbsp;The&nbsp;arbitrator&rsquo;s&nbsp;decision&nbsp;is&nbsp;final&nbsp;and&nbsp;binding&nbsp;on&nbsp;you&nbsp;and&nbsp;YUM2GO.</p>
<p><br></p>
<p><strong>&bull; &nbsp; &nbsp;</strong><strong>Waiver</strong><strong>&nbsp;</strong><strong>of</strong><strong>&nbsp;</strong><strong>Jury</strong><strong>&nbsp;</strong><strong>Trial.</strong><strong>&nbsp;</strong>YOU&nbsp;AND&nbsp;YUM2GO&nbsp;WAIVE&nbsp;ANY&nbsp;CONSTITUTIONAL&nbsp;AND&nbsp;STATUTORY&nbsp;RIGHTS&nbsp;TO&nbsp;SUE&nbsp;IN&nbsp;COURT AND RECEIVE&nbsp;A&nbsp;JUDGE OR **** TRIAL.&nbsp;You&nbsp;and&nbsp;YUM2GO&nbsp;are&nbsp;instead&nbsp;electing to&nbsp;have&nbsp;claims and disputes&nbsp;resolved&nbsp;by&nbsp;arbitration,&nbsp;except&nbsp;as&nbsp;specified&nbsp;in&nbsp;Section 17(a)&nbsp;above. There&nbsp;is&nbsp;no&nbsp;judge&nbsp;or jury in arbitration, and ***** review&nbsp;of&nbsp;an&nbsp;arbitration&nbsp;award&nbsp;is&nbsp;limited.</p>
<p><br></p>
<p><strong>&bull; &nbsp; &nbsp;****** ** Class or Consolidated Actions; Severability.&nbsp;</strong>YOU&nbsp;AND&nbsp;YUM2GO AGREE&nbsp;TO&nbsp;***** ANY&nbsp;RIGHT&nbsp;TO&nbsp;******* CLAIMS ****** THIS ARBITRATION AGREEMENT ON A CLASS, COLLECTIVE,&nbsp;OR&nbsp;REPRESENTATIVE BASIS. ALL&nbsp;CLAIMS AND&nbsp;DISPUTES WITHIN&nbsp;THIS ARBITRATION AGREEMENT&nbsp;MUST&nbsp;BE&nbsp;ARBITRATED&nbsp;ON&nbsp;AN&nbsp;INDIVIDUAL&nbsp;BASIS&nbsp;AND&nbsp;NOT&nbsp;ON&nbsp;A&nbsp;CLASS&nbsp;BASIS.&nbsp;CLAIMS&nbsp;OF&nbsp;MORE&nbsp;THAN&nbsp;ONE&nbsp;CUSTOMER&nbsp;OR&nbsp;USER CANNOT&nbsp;BE ********** ** LITIGATED JOINTLY&nbsp;OR CONSOLIDATED WITH THOSE&nbsp;OF ANY ***** CUSTOMER&nbsp;ORUSER.&nbsp;If,&nbsp;however,&nbsp;this&nbsp;waiver of class&nbsp;** consolidated&nbsp;actions&nbsp;is&nbsp;deemed invalid&nbsp;** unenforceable&nbsp;with&nbsp;respect&nbsp;to a&nbsp;claim&nbsp;or dispute,&nbsp;neither you&nbsp;nor&nbsp;YUM2** is&nbsp;entitled to arbitration&nbsp;of&nbsp;such&nbsp;claim ** dispute.&nbsp;Instead,&nbsp;all&nbsp;such&nbsp;claims&nbsp;and&nbsp;disputes&nbsp;will&nbsp;then&nbsp;be&nbsp;resolved&nbsp;in a court&nbsp;** law,&nbsp;and&nbsp;all&nbsp;other&nbsp;provisions&nbsp;of&nbsp;this&nbsp;agreement shall&nbsp;remain&nbsp;** force.&nbsp;If&nbsp;any&nbsp;provision&nbsp;of&nbsp;this&nbsp;********* is found to&nbsp;be&nbsp;void&nbsp;or&nbsp;otherwise&nbsp;unenforceable,&nbsp;in&nbsp;whole&nbsp;or&nbsp;in part, the **** or unenforceable provision shall be severed, *** such adjudication shall not&nbsp;affect&nbsp;the&nbsp;validity of the remainder ** this Agreement.</p>
<p><br></p>
<p><strong>&bull; &nbsp; &nbsp;Decline.&nbsp;</strong>You may decline&nbsp;**** Arbitration Agreement. If you do so, neither you *** YUM2GO can force the other to&nbsp;********* because&nbsp;of this Agreement. ** opt out, you **** notify YUM2GO in ******* no&nbsp;later than 30 **** after first&nbsp;becoming&nbsp;subject&nbsp;to&nbsp;this&nbsp;Arbitration&nbsp;Agreement.&nbsp;Your&nbsp;notice&nbsp;must&nbsp;include&nbsp;**** name&nbsp;and&nbsp;address,&nbsp;your&nbsp;YUM2GO&nbsp;******** (if any), the email address *** **** to *** up your YUM2GO account&nbsp;(if&nbsp;you&nbsp;have&nbsp;one),&nbsp;and&nbsp;a&nbsp;CLEAR&nbsp;statement&nbsp;that&nbsp;you&nbsp;want&nbsp;to&nbsp;decline&nbsp;and&nbsp;opt&nbsp;out&nbsp;of&nbsp;this Arbitration&nbsp;Agreement.&nbsp;You&nbsp;must&nbsp;send&nbsp;your&nbsp;opt-out&nbsp;notice&nbsp;to:&nbsp;merchantoptout@yum2go.com.&nbsp;If you&nbsp;opt&nbsp;out&nbsp;of&nbsp;this&nbsp;Arbitration&nbsp;Agreement,&nbsp;all&nbsp;other&nbsp;parts&nbsp;of&nbsp;this&nbsp;Agreement&nbsp;will&nbsp;continue to apply to you. Opting&nbsp;out&nbsp;and declining this&nbsp;Arbitration&nbsp;Agreement&nbsp;has&nbsp;no&nbsp;effect&nbsp;on&nbsp;any&nbsp;other&nbsp;arbitration&nbsp;agreements&nbsp;that&nbsp;you&nbsp;may&nbsp;have&nbsp;entered into&nbsp;or&nbsp;may&nbsp;enter&nbsp;in&nbsp;the&nbsp;future&nbsp;with&nbsp;YUM2GO.&nbsp;NOTWITHSTANDING&nbsp;ANYTHING&nbsp;TO&nbsp;THE ******** HEREIN, ******* ** THIS AGREEMENT ***** SUPERSEDE, AMEND, OR MODIFY THE TERMS OF ANY SEPARATE AGREEMENT(S) ******* YOU AND YUM2GO.</p>
<p><br></p>
<p>&bull; &nbsp; &nbsp;Survival Term. **** Arbitration Agreement will survive *** termination of your ************ with YUM2GO.</p>
<p><br></p>
<p>&bull; &nbsp; &nbsp;Modification. *************** any provision ** the Agreement to the contrary, we agree that if YUM2GO makes any future material change ** **** Arbitration Agreement, it will not apply to any ********** claim(s) that you *** ******* provided notice of ** YUM2GO.</p>
<p><br></p>
<p>&nbsp; &nbsp; &bull; &nbsp; &nbsp;Franchisees</p>
<p>&nbsp; &nbsp; &nbsp; &nbsp; Franchisees ********* a restaurant concept licensed by Merchant may participate ** the Program pursuant to *** terms and conditions of this Agreement provided that *** ********** franchisee: (1) ** in compliance with its franchise agreement; and (2) enters into an agreement in ************* *** **** form as the Supplemental Agreement provided by YUM2** to the Franchisee.</p>
<p><br></p>
<p>&nbsp; &nbsp; &bull; &nbsp; &nbsp;Partner Code of Conduct.</p>
<p>&nbsp; &nbsp; Merchant ****** to comply with the https://www.yum2go.com/partner/code-of-conduct, which *** ** updated by</p>
<p>&nbsp; &nbsp; YUM2GO from **** to time.</p>
<p><br></p>
<p>&nbsp; &nbsp; &bull; &nbsp; &nbsp;Communications from YUM2GO.</p>
<p>&nbsp; &nbsp; &nbsp; &nbsp; Merchant agrees ** ****** and receive communications **** YUM2GO or Drivers, including via email, text message, calls, and push notifications to *** cellular ********* number ******** provides to YUM2GO. Merchant acknowledges that ******** may ******* communications generated by automatic telephone dialing systems and/or ***** **** deliver *********** messages sent ** or ** behalf ** YUM2GO, its affiliated ********* and/** Drivers. Merchant *** *** out ** **** ************** in Merchant&rsquo;s Account Settings ** ** replying &ldquo;STOP&rdquo; from the mobile device receiving **** messages.</p>
<p><br></p>
<p>&nbsp; &nbsp; &bull; &nbsp; &nbsp;General Provisions.</p>
<p>Nothing&nbsp;in&nbsp;these&nbsp;Terms&nbsp;** to&nbsp;be&nbsp;construed&nbsp;** creating&nbsp;an&nbsp;agency,&nbsp;partnership,&nbsp;or&nbsp;joint&nbsp;venture&nbsp;relationship&nbsp;between YUM2GO&nbsp;and&nbsp;Merchant, and except as expressly set ***** herein, each party shall be responsible *** its own ***** of performance&nbsp;hereunder.&nbsp;As&nbsp;set forth&nbsp;on&nbsp;the&nbsp;Sign-Up&nbsp;Sheet&nbsp;executed&nbsp;between&nbsp;Merchant&nbsp;and&nbsp;YUM2GO,&nbsp;these&nbsp;Terms&nbsp;form part&nbsp;of&nbsp;an&nbsp;Agreement&nbsp;between&nbsp;the&nbsp;parties, ***** ********** all prior agreements and communications ** the parties, oral&nbsp;or&nbsp;written,&nbsp;with&nbsp;respect&nbsp;to&nbsp;the&nbsp;subject&nbsp;matter&nbsp;hereof.&nbsp;The&nbsp;rights&nbsp;and&nbsp;obligations&nbsp;set&nbsp;forth&nbsp;in&nbsp;these&nbsp;Terms,&nbsp;which&nbsp;by their ****** should, or ** their ******* ***** do, survive, or ****** beyond&nbsp;the termination or expiration of these Terms shall&nbsp;so&nbsp;survive&nbsp;and&nbsp;extend.&nbsp;Except&nbsp;as&nbsp;set&nbsp;forth&nbsp;herein,&nbsp;no&nbsp;amendment&nbsp;to,&nbsp;or&nbsp;waiver&nbsp;of,&nbsp;any&nbsp;provision&nbsp;of&nbsp;this&nbsp;Agreement will&nbsp;be&nbsp;effective&nbsp;unless&nbsp;in&nbsp;writing&nbsp;and&nbsp;signed&nbsp;by&nbsp;both&nbsp;parties.&nbsp;The&nbsp;waiver&nbsp;by&nbsp;any&nbsp;party&nbsp;of&nbsp;any&nbsp;breach&nbsp;or&nbsp;default will not constitute a waiver of any different ** subsequent ****** or default. This Agreement ** ******** by *** interpreted in accordance&nbsp;with&nbsp;the&nbsp;laws&nbsp;of&nbsp;the&nbsp;State&nbsp;of Nevada&nbsp;without&nbsp;regard&nbsp;to&nbsp;the&nbsp;conflicts&nbsp;of&nbsp;laws&nbsp;principles thereof.&nbsp;Except&nbsp;as set&nbsp;forth&nbsp;above&nbsp;in&nbsp;Section&nbsp;17&nbsp;(&ldquo;Dispute&nbsp;Resolution&rdquo;),&nbsp;the&nbsp;parties&nbsp;hereby&nbsp;consent&nbsp;to&nbsp;exclusive&nbsp;jurisdiction&nbsp;in&nbsp;*** designated&nbsp;county court in Nevada ** which *** merchant is located.&nbsp;Merchant&nbsp;may not&nbsp;assign&nbsp;this&nbsp;Agreement&nbsp;in whole&nbsp;or in **** without&nbsp;YUM2GO&rsquo;s prior written consent. YUM2GO may&nbsp;freely assign this&nbsp;Agreement.</p>
<p><br></p>
<p>This&nbsp;Agreement&nbsp;will be&nbsp;binding&nbsp;upon,&nbsp;and&nbsp;take&nbsp;effect&nbsp;to&nbsp;come&nbsp;to&nbsp;the&nbsp;benefit&nbsp;of,&nbsp;the&nbsp;permitted&nbsp;successors&nbsp;and&nbsp;assigns of each&nbsp;party,&nbsp;*** shall&nbsp;not&nbsp;confer&nbsp;any&nbsp;rights&nbsp;or&nbsp;remedies&nbsp;upon&nbsp;any&nbsp;other&nbsp;third&nbsp;party.&nbsp;All&nbsp;notices,&nbsp;requests,&nbsp;consents,&nbsp;and other communications hereunder&nbsp;must&nbsp;be&nbsp;** writing, *** ********* by ********* ******* to the addresses set forth ** the Sign-Up&nbsp;Sheet&nbsp;(or&nbsp;any&nbsp;updated&nbsp;address&nbsp;properly&nbsp;noticed&nbsp;hereunder).&nbsp;YUM2GO&nbsp;address&nbsp;is&nbsp;<strong>${data.businessAddress}</strong>.&nbsp;If&nbsp;any&nbsp;provision of&nbsp;this&nbsp;Agreement is&nbsp;held&nbsp;to&nbsp;be&nbsp;invalid,&nbsp;illegal&nbsp;or&nbsp;unenforceable&nbsp;for&nbsp;any&nbsp;reason,&nbsp;such&nbsp;invalidity, illegality&nbsp;or&nbsp;un-enforceability&nbsp;will not&nbsp;affect&nbsp;any&nbsp;other&nbsp;provisions&nbsp;of&nbsp;this&nbsp;Agreement,&nbsp;and&nbsp;this&nbsp;Agreement&nbsp;will be&nbsp;construed as&nbsp;if&nbsp;such&nbsp;invalid,&nbsp;illegal&nbsp;or&nbsp;unenforceable provision&nbsp;had&nbsp;never&nbsp;been&nbsp;contained&nbsp;here.</p>
""";
  }
}
