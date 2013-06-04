-- Copyright © 2013 VillageReach.  All Rights Reserved.  This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0.
-- If a copy of the MPL was not distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0/.

INSERT INTO master_rnr_columns
(  name                           ,  position  ,                         label                                  , source         , sourceConfigurable         ,                        formula                           , indicator          , used       ,  visible      , mandatory    ,  description)
VALUES
(  'productCode'                   ,          1 , 'Product Code'                                                 ,'R'             , false                      , ''                                                       , 'O'                , true       , true          , false         , 'Unique identifier for each commodity'                                                                            ),
(  'product'                       ,          2 , 'Product'                                                      ,'R'             , false                      , ''                                                       , 'R'                , true       , true          , true         , 'Primary name of the product'                                                                                     ),
(  'dispensingUnit'                ,          3 , 'Unit/Unit of Issue'                                           ,'R'             , false                      , ''                                                       , 'U'                , true       , true          , false        , 'Dispensing unit for this product'                                                                                ),
(  'beginningBalance'              ,          4 , 'Beginning Balance'                                            ,'U'             , false                      , ''                                                       , 'A'                , true       , true          , false        , 'Stock in hand of previous period.This is quantified in dispensing units'                                         ),
(  'quantityReceived'              ,          5 , 'Total Received Quantity'                                      ,'U'             , false                      , ''                                                       , 'B'                , true       , true          , false        , 'Total quantity received in last period.This is quantified in dispensing units'                                   ),
(  'total'                         ,          6 , 'Total'                                                        ,'C'             , false                      , 'A + B'                                                  , 'M'                , true       , true          , false        , 'Total of beginning balance and quantity received'                                                     ),
(  'quantityDispensed'             ,          7 , 'Total Consumed Quantity'                                      ,'U'             , true                       , 'A + B (+/-) D - E'                                      , 'C'                , true       , true          , false        , 'Quantity dispensed/consumed in last reporting  period. This is quantified in dispensing units'                   ),
(  'lossesAndAdjustments'          ,          8 , 'Total Losses / Adjustments'                                   ,'U'             , false                      , 'D1 + D2+D3...DN'                                        , 'D'                , true       , true          , false        , 'All kind of looses/adjustments made at the facility'                                                             ),
(  'stockInHand'                   ,          9 , 'Stock on Hand'                                                ,'U'             , true                       , 'A+B(+/-)D-C'                                            , 'E'                , true       , true          , false        , 'Current physical count of stock on hand. This is quantified in dispensing units'                                 ),
(  'newPatientCount'               ,         10 , 'Total number of new patients added to service on the program' ,'U'             , false                      , ''                                                       , 'F'                , true       , true          , false        , 'Total of new patients introduced'                                                                                ),
(  'stockOutDays'                  ,         11 , 'Total Stockout Days'                                          ,'U'             , false                      , ''                                                       , 'X'                , true       , true          , false        , 'Total number of days facility was out of stock'                                                                  ),
(  'normalizedConsumption'         ,         12 , 'Adjusted Total Consumption'                                   ,'C'             , false                      , 'C * (M*30)/((M*30)-X) + ( F* No of tabs per month * 1)' , 'N'                , true       , true          , false        , 'Total quantity consumed after adjusting for stockout days. This is quantified in dispensing units'               ),
(  'amc'                           ,         13 , 'Average Monthly Consumption(AMC)'                             ,'C'             , false                      , '(N/M + Ng-1/M + ...Ng-(g-1)/M)/G'                       , 'P'                , true       , true          , false        , 'Average Monthly consumption, for last three months. This is quantified in dispensing units'                      ),
(  'maxStockQuantity'              ,         14 , 'Maximum Stock Quantity'                                       ,'C'             , false                      , 'P * MaxMonthsStock'                                     , 'H'                , true       , true          , false        , 'Maximum Stock calculated based on consumption and max months of stock.This is quantified in dispensing units'    ),
(  'calculatedOrderQuantity'       ,         15 , 'Calculated Order Quantity'                                    ,'C'             , false                      , 'H - E'                                                  , 'I'                , true       , true          , false        , 'Actual Quantity needed after deducting stock in hand. This is quantified in dispensing units'                    ),
(  'quantityRequested'             ,         16 , 'Requested Quantity'                                           ,'U'             , false                      ,  ''                                                      , 'J'                , true       , true          , false        , 'Requested override of calculated quantity.This is quantified in dispensing units'                                ),
(  'reasonForRequestedQuantity'    ,         17 , 'Requested Quantity Explanation'                               ,'U'             , false                      ,  ''                                                      , 'W'                , true       , true          , false        , 'Explanation of request for a quantity other than calculated order quantity'                                      ),
(  'quantityApproved'              ,         18 , 'Approved Quantity'                                            ,'U'             , false                      ,  ''                                                      , 'K'                , true       , true          , false        , 'Final approved quantity. This is quantified in dispensing units'                                                 ),
(  'packsToShip'                   ,         19 , 'Packs to Ship'                                                ,'C'             , false                      , 'K / U + Rounding rules'                                 , 'V'                , true       , true          , false        , 'Total packs to be shipped based on pack size and applying rounding rules'                                        ),
(  'price'                         ,         20 , 'Price per Pack'                                               ,'R'             , false                      ,  ''                                                      , 'T'                , true       , true          , false        , 'Price per Pack. It defaults to zero if not specified.'                                                           ),
(  'cost'                          ,         21 , 'Total Cost'                                                   ,'C'             , false                      , 'V * T'                                                  , 'Q'                , true       , true          , false        , 'Total cost of the product. This will be zero if price is not defined'                                            ),
(  'expirationDate'                ,         22 , 'Expiration Date'                                              ,'U'             , false                      , ''                                                       , 'G'                , true       , true          , false        , 'Expiration Date'                                                                                                 ),
(  'remarks'                       ,         23 , 'Remarks'                                                      ,'U'             , false                      , ''                                                       , 'L'                , true       , true          , false        , 'Any additional remarks'                                                                                          );


