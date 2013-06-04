-- Copyright © 2013 VillageReach.  All Rights Reserved.  This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0.
-- If a copy of the MPL was not distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0/.

delete from program_rnr_columns;
insert into program_rnr_columns
(masterColumnId, programId, visible, source, position, label)
values
(1, (select id from programs where code = 'TB'),  true, 'R', 1,  'Product Code'),
(2, (select id from programs where code = 'TB'),  true, 'R', 2,  'Product'),
(3, (select id from programs where code = 'TB'),  true, 'R', 3,  'Unit/Unit of Issue'),
(4, (select id from programs where code = 'TB'),  true, 'U', 4,  'Beginning Balance'),
(5, (select id from programs where code = 'TB'),  true, 'U', 5,  'Total Received Quantity'),
(6, (select id from programs where code = 'TB'),  true, 'C', 6,  'Total'),
(7, (select id from programs where code = 'TB'),  true, 'U', 7,  'Total Consumed Quantity'),
(8, (select id from programs where code = 'TB'),  true, 'U', 8,  'Total Losses / Adjustments'),
(9, (select id from programs where code = 'TB'),  true, 'C', 9,  'Stock on Hand'),
(10, (select id from programs where code = 'TB'),  true, 'U', 10, 'New Patients'),
(11, (select id from programs where code = 'TB'), true, 'U', 11, 'Total Stockout Days'),
(12, (select id from programs where code = 'TB'), true, 'C', 12, 'Adjusted Total Consumption'),
(13, (select id from programs where code = 'TB'), true, 'C', 13, 'Average Monthly Consumption(AMC)'),
(14, (select id from programs where code = 'TB'), true, 'C', 14, 'Maximum Stock Quantity'),
(15, (select id from programs where code = 'TB'), true, 'C', 15, 'Calculate d Order Quantity'),
(16, (select id from programs where code = 'TB'), true, 'U', 16, 'Requested Quantity'),
(17, (select id from programs where code = 'TB'), true, 'U', 17, 'Requested Quantity Explanation'),
(18, (select id from programs where code = 'TB'), true, 'U', 18, 'Approved Quantity'),
(19, (select id from programs where code = 'TB'), true, 'C', 19, 'Packs to Ship'),
(20, (select id from programs where code = 'TB'), true, 'R', 20, 'Price per Pack'),
(21, (select id from programs where code = 'TB'), true, 'C', 21, 'Total Cost'),
(22, (select id from programs where code = 'TB'), true, 'U', 22, 'Expiration Date'),
(23, (select id from programs where code = 'TB'), true, 'U', 23, 'Remarks'),
(1, (select id from programs where code = 'ESS_MEDS'),  true, 'R', 1,  'Product Code'),
(2, (select id from programs where code = 'ESS_MEDS'),  true, 'R', 2,  'Product'),
(3, (select id from programs where code = 'ESS_MEDS'),  true, 'R', 3,  'Unit/Unit of Issue'),
(4, (select id from programs where code = 'ESS_MEDS'),  true, 'U', 4,  'Beginning Balance'),
(5, (select id from programs where code = 'ESS_MEDS'),  true, 'U', 5,  'Total Received Quantity'),
(6, (select id from programs where code = 'ESS_MEDS'),  true, 'C', 6,  'Total'),
(7, (select id from programs where code = 'ESS_MEDS'),  true, 'U', 7,  'Total Consumed Quantity'),
(8, (select id from programs where code = 'ESS_MEDS'),  true, 'U', 8,  'Total Losses / Adjustments'),
(9, (select id from programs where code = 'ESS_MEDS'),  true, 'C', 9,  'Stock on Hand'),
(10, (select id from programs where code = 'ESS_MEDS'),  true, 'U', 10, 'New Patients'),
(11, (select id from programs where code = 'ESS_MEDS'), true, 'U', 11, 'Total Stockout Days'),
(12, (select id from programs where code = 'ESS_MEDS'), true, 'C', 12, 'Adjusted Total Consumption'),
(13, (select id from programs where code = 'ESS_MEDS'), true, 'C', 13, 'Average Monthly Consumption(AMC)'),
(14, (select id from programs where code = 'ESS_MEDS'), true, 'C', 14, 'Maximum Stock Quantity'),
(15, (select id from programs where code = 'ESS_MEDS'), true, 'C', 15, 'Calculated Order Quantity'),
(16, (select id from programs where code = 'ESS_MEDS'), true, 'U', 16, 'Requested Quantity'),
(17, (select id from programs where code = 'ESS_MEDS'), true, 'U', 17, 'Requested Quantity Explanation'),
(18, (select id from programs where code = 'ESS_MEDS'), true, 'U', 18, 'Approved Quantity'),
(19, (select id from programs where code = 'ESS_MEDS'), true, 'C', 19, 'Packs to Ship'),
(20, (select id from programs where code = 'ESS_MEDS'), true, 'R', 20, 'Price per Pack'),
(21, (select id from programs where code = 'ESS_MEDS'), true, 'C', 21, 'Total Cost'),
(22, (select id from programs where code = 'ESS_MEDS'), true, 'U', 22, 'Expiration Date'),
(23, (select id from programs where code = 'ESS_MEDS'), true, 'U', 23, 'Remarks');


update programs set templateConfigured = true where id in ((select id from programs where code = 'ESS_MEDS'),
(select id from programs where code = 'TB'));
