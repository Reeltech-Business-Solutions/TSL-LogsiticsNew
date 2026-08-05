tableextension 50022 "Job Journal Ext" extends "Job Journal Line"
{
    fields
    {

        field(50000; "Requisition No."; Code[20])
        {
        }
        field(50003; "Job Type"; Option)
        {
            OptionMembers = Internal,External;
        }
        field(50004; "Requested Qty"; Decimal)
        {

        }
        field(50005; "Service Item No."; Code[20])
        {

        }
        field(50006; "Service Item Line No."; Integer)
        {

        }
        field(50007; "Shelf/Bin Code"; Code[20])
        {

        }
        field(50008; Cage; Text[30])
        {

        }
        field(50103; "Customer Job Type"; Code[20])
        {

        }
        field(50104; "Job Type Code"; Code[20])
        {

        }
        field(50105; "Responsibility Center"; Code[20])
        {

        }
        field(50200; Collector; Code[30])
        {

        }
        field(50201; "Department Store"; Code[20])
        {

        }
        field(50202; "Control No."; Code[6])
        {

        }
        field(50203; "Prod. Group"; Code[20])
        {

        }
        field(50210; "Clock Type"; Option)
        {
            OptionMembers = ,Normal,Overclock,Underclock;
        }
        field(50211; "Fixed Assets No."; Code[20])
        {

        }
        field(50212; "Maintenance Code"; Code[20])
        {

        }
        field(50213; "Operation Code"; Code[50])
        {

        }
        field(50214; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
            end;
        }
        field(50215; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4, "Shortcut Dimension 4 Code");
            end;

        }
        field(50216; "Item Type"; Option)
        {
            OptionMembers = ,Spares,Lubricant,Tyres,Battery,Fuel,Others,Labour;
        }
        field(50217; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(5, "Shortcut Dimension 5 Code");
            end;

        }
        field(50218; "Shortcut Dimension 6 Code"; Code[20])
        {
            CaptionClass = '1,2,6';
            Caption = 'Shortcut Dimension 6 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(6, "Shortcut Dimension 6 Code");
            end;

        }
    }
}