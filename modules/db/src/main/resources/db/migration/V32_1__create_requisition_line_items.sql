drop table if exists requisition_line_items;
create table requisition_line_items (
id serial primary key,
rnrId int not null references requisitions(id),
productCode varchar(50) not null references products(code),
product varchar(250) ,
dispensingUnit VARCHAR(20) not null,
beginningBalance integer,
quantityReceived integer,
quantityDispensed integer,
estimatedConsumption integer,
stockInHand integer,
quantityRequested integer,
reasonForRequestedQuantity text,
calculatedOrderQuantity integer,
quantityApproved integer,
totalLossesAndAdjustments integer,
newPatientCount integer,
stockOutDays integer,
normalizedConsumption integer,
amc numeric(14, 4),
maxMonthsOfStock integer NOT NULL,
maxStockQuantity integer,
packsToShip integer,
price NUMERIC(15, 4),
remarks text,
dosesPerMonth integer not null,
dosesPerDispensingUnit integer not null,
packSize smallint not null,
roundToZero BOOLEAN,
packRoundingThreshold integer,
fullSupply BOOLEAN NOT NULL,
modifiedBy VARCHAR(50),
modifiedDate TIMESTAMP  DEFAULT  CURRENT_TIMESTAMP
);