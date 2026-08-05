table 50037 "Processed Billing Line"
{
    Caption = 'Billing Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            // AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Transaction Date"; Date)
        {
            Caption = 'Transaction Date';
            DataClassification = ToBeClassified;
        }
        field(3; "Contract Id"; Code[20])
        {
            Caption = 'Contract Id';
            TableRelation = "Contract Agreement"."No.";
            DataClassification = ToBeClassified;
        }
        field(4; "Truck No."; Code[20])
        {
            Caption = 'Truck No.';
            DataClassification = ToBeClassified;
            TableRelation = "Fixed Asset";
        }
        field(5; "Truck Type"; Code[20])
        {
            Caption = 'Truck Type';
            TableRelation = "Vehicle Make".Code;
            DataClassification = ToBeClassified;
        }
        field(6; "User Id"; Code[20])
        {
            Caption = 'User Id';
            DataClassification = ToBeClassified;
        }
        field(7; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = ToBeClassified;
        }
        field(8; "AvaialabilityPer Truck No.Days"; Decimal)
        {
            Caption = 'Avaialability Per Truck  No. Days';
            DataClassification = ToBeClassified;
        }
        field(9; "Distance Covered Km"; Decimal)
        {
            Caption = 'Distance Covered Km';
            DataClassification = ToBeClassified;
        }
        field(10; "No of Days"; Decimal)
        {
            Caption = 'No of Days';
            DataClassification = ToBeClassified;
        }
        field(12; "Arrival time at loading point"; Time)
        {
            Caption = 'Arrival time at loading point';
            DataClassification = ToBeClassified;
        }
        field(13; "DepartureTimefrom LoadingPoint"; Time)
        {
            Caption = 'Departure Time from Loading Point';
            DataClassification = ToBeClassified;
        }
        field(14; "ResidencyTime at loading point"; Time)
        {
            Caption = 'Residency Time at loading point ';
            DataClassification = ToBeClassified;
        }
        field(15; "ArrivalTime at OffloadingPoint"; Time)
        {
            Caption = 'Arrival Time at Offloading Point';
            DataClassification = ToBeClassified;
        }
        field(16; "DepartureTimefromOfloadinPoint"; Time)
        {
            Caption = 'Departure Time from Offloading Point ';
            DataClassification = ToBeClassified;
        }
        field(17; "ResidencyTimeatoffloadingpoint"; Time)
        {
            Caption = 'Residency Time at off-loading point ';
            DataClassification = ToBeClassified;
        }
        field(18; "Batch Entry No"; Integer)
        {
            Caption = 'Batch Entry No';
            DataClassification = ToBeClassified;
        }
        field(21; "Tolerance KG"; Decimal)
        {
            Caption = 'Tolerance KG';
            DataClassification = ToBeClassified;
        }
        field(22; Shortages; Decimal)
        {
            Caption = 'Shortages';
            DataClassification = ToBeClassified;
        }
        field(23; "Shortages Amount"; Decimal)
        {
            Caption = 'Shortages Amount';
            DataClassification = ToBeClassified;
        }

        field(25; "Fixed Cost"; decimal)
        {
            Caption = 'Fixed Cost';

            DataClassification = ToBeClassified;
        }

        field(26; "Variable Cost"; decimal)
        {
            Caption = 'Variable Cost';

            DataClassification = ToBeClassified;
        }

        field(27; "Loading Delay Cost"; decimal)
        {
            Caption = 'Loading Delay Cost';

            DataClassification = ToBeClassified;
        }

        field(29; "Direct Dispatch"; Code[20])
        {
            Caption = 'Direct Dispatch';
            TableRelation = Location.Code;

            DataClassification = ToBeClassified;
        }
        field(30; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer;

            DataClassification = ToBeClassified;
        }

        field(31; "Quantity Loaded NetWgt Kg"; Decimal)
        {
            Caption = 'Quantity Loaded NetWgt Kg';


            DataClassification = ToBeClassified;
        }

        field(32; "Quantity Offloaded Kg"; Decimal)
        {
            Caption = 'Quantity Offloaded Kg';


            DataClassification = ToBeClassified;
        }

        field(33; "Actual Journey Time"; Time)
        {
            Caption = 'Actual Journey Time';


            DataClassification = ToBeClassified;
        }

        field(34; "Expected Journey Time"; Time)
        {
            Caption = 'Expected Journey Time';


            DataClassification = ToBeClassified;
        }

        field(35; "Off Load Depot"; Code[20])
        {
            Caption = 'Off Load Depot';
            DataClassification = ToBeClassified;
        }

        field(36; "Sales Document No."; Code[20])
        {
            Caption = 'Sales Document No.';
            DataClassification = ToBeClassified;
        }
        field(37; "Fixed Rate"; Decimal)
        {
            Caption = 'Fixed Rate';
            DataClassification = ToBeClassified;
        }
        field(38; "Variable Rate"; Decimal)
        {
            Caption = 'Variable Rate';
            DataClassification = ToBeClassified;
        }
        field(39; Treated; Boolean)
        {
            Caption = 'Treated';
            DataClassification = ToBeClassified;
        }
        field(40; "Drivers Name"; Text[100])
        {
            Caption = 'Drivers Name';
            DataClassification = ToBeClassified;
        }
        field(41; "Truck Id"; Code[20])
        {
            Caption = 'Truck Id';
            DataClassification = ToBeClassified;
        }
        field(42; "WayBill No."; Code[20])
        {
            Caption = 'WayBill No.';
            DataClassification = ToBeClassified;
        }
        field(43; "Drivers Code"; Code[20])
        {
            //  Caption = 'WayBill No.';
            DataClassification = ToBeClassified;
        }
        field(44; "Location Destination"; Code[20])
        {
            Caption = 'Location Destination';
            TableRelation = Location;
            DataClassification = ToBeClassified;
        }
        field(45; "Product Type"; Code[20])
        {
            Caption = 'Product Type';
            TableRelation = "Item Category";
            DataClassification = ToBeClassified;
        }
        field(46; "Unit Of Measure"; Code[20])
        {
            Caption = 'Unit Of Measure';
            TableRelation = "Unit of Measure";
            DataClassification = ToBeClassified;
        }
        field(47; "Batch Entry No."; Integer)
        {
            Caption = 'Batch Entry No.';
            // AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(50001; "Customer Name"; Text[150])
        {
            Caption = 'Customer Name';
            // AutoIncrement = true;
            DataClassification = ToBeClassified;
        }

        field(50002; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            // AutoIncrement = true;
            FieldClass = FlowFilter;

        }
        field(50003; "Item Description"; Text[150])
        {
            Caption = 'Item Description';
            // AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(50004; "Truck Capacity"; Text[20])
        {
            Caption = 'Truck Capacity';
            // AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(50005; "Trip No."; Text[20])
        {
            Caption = 'Trip No.';
            // AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(50006; "SMR Number"; Text[20])
        {
            Caption = 'SMR Number';
            // AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(50007; "Source Location Name"; Text[20])
        {
            Caption = 'Source Location Name';
            // AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(50008; "Destination Location Name"; Text[20])
        {
            Caption = 'Destination Location Name';
            // AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(50009; City; Text[20])
        {
            Caption = 'City';
            // AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(50010; "Available days"; Decimal)
        {
            Caption = 'Available days';
            // AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(50011; "FMN Idle"; Decimal)
        {
            Caption = 'FMN Idle';
            // AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(50012; "CST Idle"; Decimal)
        {
            Caption = 'CST Idle';
            // AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(50013; "SO Number"; Code[20])
        {
            Caption = 'SO Number';
            // AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(50014; "Fixed Invoice No."; Code[20])
        {
            Caption = 'Fixed Invoice No.';
            // AutoIncrement = true;
            DataClassification = ToBeClassified;
        }




    }
    keys
    {
        key(PK; "Batch Entry No.")
        {
            Clustered = true;
        }

        key(NewKey; "Contract Id", "Truck Type", "Customer No.", "Direct Dispatch", "Truck No.")
        {
            SumIndexFields = "Distance Covered Km", "No of Days", Shortages, "Variable Cost", "Fixed Cost", Quantity, "Quantity Loaded NetWgt Kg", "Quantity Offloaded Kg";
        }
        key(NewKey2; "Contract Id", "Sales Document No.", Treated)
        {
            SumIndexFields = "Distance Covered Km", "No of Days", Shortages, "Variable Cost", "Fixed Cost", Quantity, "Quantity Loaded NetWgt Kg", "Quantity Offloaded Kg";
        }
        key(NewKey3; "Contract Id", "Transaction Date", "Location Destination", Treated)
        {

        }
    }
}
