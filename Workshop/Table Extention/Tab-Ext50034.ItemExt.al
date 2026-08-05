tableextension 50034 ItemExt extends Item
{
    fields
    {
        field(50000; Supercedence; Code[20]) { DataClassification = ToBeClassified; }
        field(50001; "Cross Reference Source1"; Code[20]) { DataClassification = ToBeClassified; }
        field(50002; "Cross Ref. Source1 Part No."; Code[20]) { DataClassification = ToBeClassified; }
        field(50003; "Return Value"; Decimal) { DataClassification = ToBeClassified; }
        field(50004; "User Id"; Code[20]) { DataClassification = ToBeClassified; }
        field(50005; "Minimum Inventory"; Decimal) { DataClassification = ToBeClassified; }
        field(50006; "Cross Reference Source2"; Code[20]) { DataClassification = ToBeClassified; }
        field(50007; "Mis Levy1 Rate"; Decimal) { DataClassification = ToBeClassified; }
        field(50008; "Qty. On Request"; Decimal) { DataClassification = ToBeClassified; }
        field(50009; "Amount"; Decimal) { DataClassification = ToBeClassified; }
        field(50010; "Mis Levy2 Rate"; Decimal) { DataClassification = ToBeClassified; }
        field(50011; "Cross Ref. Source2 Part No."; Code[20]) { DataClassification = ToBeClassified; }
        field(50012; "Cross Reference Source3"; Code[20]) { DataClassification = ToBeClassified; }
        field(50013; "Cross Ref. Source3 Part No."; Code[20]) { DataClassification = ToBeClassified; }
        field(50014; "Mis Levy3 Rate"; Decimal) { DataClassification = ToBeClassified; }
        field(50015; "User ID 2"; Code[20]) { DataClassification = ToBeClassified; }
        field(50016; "Markup for LOL"; Decimal) { DataClassification = ToBeClassified; }
        field(50017; "Movement Exist"; Boolean) { DataClassification = ToBeClassified; }
        field(50018; "Sector 1"; Code[20]) { DataClassification = ToBeClassified; }
        field(50019; "Cross Reference Source4"; Code[20]) { DataClassification = ToBeClassified; }
        field(50020; "Cross Ref. Source4 Part No."; Code[20]) { DataClassification = ToBeClassified; }
        field(50021; "Description Source1"; Text[30]) { DataClassification = ToBeClassified; }
        field(50022; "Minimum Retail Price"; Decimal) { DataClassification = ToBeClassified; }
        field(50023; "Model"; Text[30]) { DataClassification = ToBeClassified; }
        field(50024; "Description Source3"; Text[30]) { DataClassification = ToBeClassified; }
        field(50025; "Description Source4"; Text[30]) { DataClassification = ToBeClassified; }
        field(50026; "Entrytypefilter"; Option)
        {
            OptionMembers = Purchase,Sale,"Positive Adjmt.","Negative Adjmt.",Transfer,Consumption,Output,Issue,Return;
        }
        field(50027; "Location"; Code[20]) { DataClassification = ToBeClassified; }
        field(50028; "Lead Time In Mths"; Decimal) { DataClassification = ToBeClassified; }
        field(50029; "Cost Posted to G/L"; Decimal) { DataClassification = ToBeClassified; }
        field(50030; "Assind.Part Consumpt. Category"; Option)
        {
            OptionMembers = " ","A- Fast Moving & High Sales Turnover","B - Slow Moving and High Sales Contribution","C - Fast Moving but less sales contribution","D - Slow Moving and less sales contribution";
        }
        field(50031; "Issue Qty"; Decimal) { DataClassification = ToBeClassified; }
        field(50032; "Return Qty"; Decimal) { DataClassification = ToBeClassified; }
        field(50033; "Issue Value"; Decimal) { DataClassification = ToBeClassified; }
        field(50034; "Bin Code"; Code[25]) { DataClassification = ToBeClassified; }
        field(50035; "Parts Consumption Category"; Code[20]) { DataClassification = ToBeClassified; }
        field(50036; "Shelf/Bin No."; Code[20]) { DataClassification = ToBeClassified; }
        field(50037; "OEM"; Code[20]) { DataClassification = ToBeClassified; }
        field(50038; "Part Status"; Option)
        {
            OptionMembers = " ",Current,"Superseded But Obsolete","Superseded But Usable";
        }
        field(50039; "Contribution Category(12M)"; Option)
        {
            OptionMembers = ,"H - Contributes to 80% of turnover","L- Contributes to 20% of Sales Turnover";
        }
        field(50040; "Weight Per Item (KG)"; Decimal) { DataClassification = ToBeClassified; }
        field(50041; "Store Location"; Code[20]) { DataClassification = ToBeClassified; }
        field(50042; "Std.Ex Original Supplier Price"; Decimal) { DataClassification = ToBeClassified; }
        field(50043; "Last Purchase Date"; Date) { DataClassification = ToBeClassified; }
        field(50044; "Monthly Consumption"; Decimal) { DataClassification = ToBeClassified; }
        field(50045; "OEM Option Code1"; Text[30]) { DataClassification = ToBeClassified; }
        field(50046; "OEM Description1"; Text[50]) { DataClassification = ToBeClassified; }
        field(50047; "OEM Description2"; Text[50]) { DataClassification = ToBeClassified; }
        field(50048; "OEM Description3"; Text[50]) { DataClassification = ToBeClassified; }
        field(50049; "OEM Description4"; Text[50]) { DataClassification = ToBeClassified; }
        field(50050; "OEM Description5"; Text[50]) { DataClassification = ToBeClassified; }
        field(50051; "OEM Description6"; Text[50]) { DataClassification = ToBeClassified; }
        field(50052; "OEM Description7"; Text[50]) { DataClassification = ToBeClassified; }
        field(50053; "OEM Description8"; Text[50]) { DataClassification = ToBeClassified; }
        field(50054; "OEM Description9"; Text[50]) { DataClassification = ToBeClassified; }
        field(50055; "OEM Description10"; Text[50]) { DataClassification = ToBeClassified; }
        field(50056; "OEM Option Code2"; Text[50]) { DataClassification = ToBeClassified; }
        field(50057; "OEM Option Code3"; Text[30]) { DataClassification = ToBeClassified; }
        field(50058; "OEM Option Code4"; Text[30]) { DataClassification = ToBeClassified; }
        field(50059; "OEM Option Code5"; Text[30]) { DataClassification = ToBeClassified; }
        field(50060; "OEM Option Code6"; Text[30]) { DataClassification = ToBeClassified; }
        field(50061; "OEM Option Code7"; Text[30]) { DataClassification = ToBeClassified; }
        field(50062; "OEM Option Code8"; Text[30]) { DataClassification = ToBeClassified; }
        field(50063; "OEM Option Code9"; Text[30]) { DataClassification = ToBeClassified; }
        field(50064; "OEM Option Code10"; Text[30]) { DataClassification = ToBeClassified; }
        field(50065; "OEM Option Code11"; Text[30]) { DataClassification = ToBeClassified; }
        field(50066; "OEM Option Code12"; Text[30]) { DataClassification = ToBeClassified; }
        field(50067; "OEM Option Code13"; Text[30]) { DataClassification = ToBeClassified; }
        field(50068; "OEM Option Code14"; Text[30]) { DataClassification = ToBeClassified; }
        field(50069; "OEM Option Code15"; Text[30]) { DataClassification = ToBeClassified; }
        field(50070; "OEM Description11"; Text[50]) { DataClassification = ToBeClassified; }
        field(50071; "OEM Description12"; Text[50]) { DataClassification = ToBeClassified; }
        field(50072; "OEM Description13"; Text[50]) { DataClassification = ToBeClassified; }
        field(50073; "OEM Description14"; Text[50]) { DataClassification = ToBeClassified; }
        field(50074; "OEM Description15"; Text[50]) { DataClassification = ToBeClassified; }
        field(50075; "Currency"; Code[20]) { DataClassification = ToBeClassified; }
        field(50076; "Overseas Charge"; Decimal) { DataClassification = ToBeClassified; }
        field(50077; "HS Code"; Code[20]) { DataClassification = ToBeClassified; }
        field(50078; "Add Ancilliary Charge"; Decimal) { DataClassification = ToBeClassified; }
        field(50079; "Freight"; Decimal) { DataClassification = ToBeClassified; }
        field(50080; "Marine Insurance"; Decimal) { DataClassification = ToBeClassified; }
        field(50081; "Surcharge Rate"; Decimal) { DataClassification = ToBeClassified; }
        field(50082; "Add CISS Levy"; Decimal) { DataClassification = ToBeClassified; }
        field(50083; "Add TLS Levy"; Decimal) { DataClassification = ToBeClassified; }
        field(50084; "Ports and Transport Rate"; Decimal) { DataClassification = ToBeClassified; }
        field(50085; "Finance Charge"; Decimal) { DataClassification = ToBeClassified; }
        field(50086; "Naira Conversion Rate"; Decimal) { DataClassification = ToBeClassified; }
        field(50087; "Where Used"; Text[50]) { DataClassification = ToBeClassified; }
        field(50088; "User Note1"; Text[50]) { DataClassification = ToBeClassified; }
        field(50089; "User Note2"; Text[50]) { DataClassification = ToBeClassified; }
        field(50090; "Cage"; Code[20]) { DataClassification = ToBeClassified; }
        field(50091; "Last Purchase Date(Import)"; Date) { DataClassification = ToBeClassified; }
        field(50092; "Assembly Charges"; Decimal) { DataClassification = ToBeClassified; }
        field(50093; "SOD"; Decimal) { DataClassification = ToBeClassified; }
        field(50094; "LM Markup Rate"; Decimal) { DataClassification = ToBeClassified; }
        field(50095; "FOB Price"; Decimal) { DataClassification = ToBeClassified; }
        field(50096; "FOB Accessories Price"; Decimal) { DataClassification = ToBeClassified; }
        field(50097; "Add Duty Surcharge"; Decimal) { DataClassification = ToBeClassified; }
        field(50098; "Total Duties&Levies"; Decimal) { DataClassification = ToBeClassified; }
        field(50099; "Clearing Charges %"; Decimal) { DataClassification = ToBeClassified; }
        field(50100; "Add Clearance Charges"; Decimal) { DataClassification = ToBeClassified; }
        field(50101; "Total Ports Charges"; Decimal) { DataClassification = ToBeClassified; }
        field(50102; "C&F Price(Naira)"; Decimal) { DataClassification = ToBeClassified; }
        field(50103; "Cost Of Sales"; Decimal) { DataClassification = ToBeClassified; }
        field(50104; "Debtors&Inventory Cost"; Decimal) { DataClassification = ToBeClassified; }
        field(50105; "Staff Commision"; Decimal) { DataClassification = ToBeClassified; }
        field(50106; "Full Cost"; Decimal) { DataClassification = ToBeClassified; }
        field(50107; "LM Markup"; Decimal) { DataClassification = ToBeClassified; }
        field(50108; "Dealer Price Before VAT"; Decimal) { DataClassification = ToBeClassified; }
        field(50109; "Dealer Price Inclusive of VAT"; Decimal) { DataClassification = ToBeClassified; }
        field(50110; "Dealer Commision"; Decimal) { DataClassification = ToBeClassified; }
        field(50111; "Total Ex OEM FOB"; Decimal) { DataClassification = ToBeClassified; }
        field(50112; "C&F Price"; Decimal) { DataClassification = ToBeClassified; }
        field(50113; "Add Insurance"; Decimal) { DataClassification = ToBeClassified; }
        field(50114; "CIF Price"; Decimal) { DataClassification = ToBeClassified; }
        field(50115; "Duty"; Decimal) { DataClassification = ToBeClassified; }
        field(50116; "Add Remmitance Charges"; Decimal) { DataClassification = ToBeClassified; }
        field(50117; "Add Boe Charges"; Decimal) { DataClassification = ToBeClassified; }
        field(50118; "LC Charges"; Decimal) { DataClassification = ToBeClassified; }
        field(50119; "Financing Interest"; Decimal) { DataClassification = ToBeClassified; }
        field(50120; "Total Financing Charges"; Decimal) { DataClassification = ToBeClassified; }
        field(50121; "Debtors & Inventory Costs"; Decimal) { DataClassification = ToBeClassified; }
        field(50122; "Add Dealer Comission"; Decimal) { DataClassification = ToBeClassified; }
        field(50123; "Std. Price Inc. of VAT"; Decimal) { DataClassification = ToBeClassified; }
        field(50124; "Add PDI Cost"; Decimal) { DataClassification = ToBeClassified; }
        field(50125; "Exchange Rate LOL"; Decimal) { DataClassification = ToBeClassified; }
        field(50126; "Port and Transport Charges"; Decimal) { DataClassification = ToBeClassified; }
        field(50127; "FOB from Supliers"; Decimal) { DataClassification = ToBeClassified; }
        field(50128; "Standard Cost2"; Decimal) { DataClassification = ToBeClassified; }
        field(50129; "Category"; Code[20]) { DataClassification = ToBeClassified; }
        field(50130; "Supplier Pre Pack Qty"; Integer) { DataClassification = ToBeClassified; }
        field(50131; "Applicable Model"; Option)
        {
            OptionMembers = " ",HDT,LDT,LDTMD,PICKUP,VW,TUNLAND,GRATOUR,"BJ 4253 -S2","BJ 4253","BJ 4183","BJ 4153","BJ 3313","BJ 3251","BJ 3225","BJ 1151","BJ 1143","BJ 1089","BJ 1069";
            OptionCaption = '" ",HDT,LDT,LDTMD,PICKUP,VW,TUNLAND';
        }
        field(50132; "Max Retal Price %"; Decimal) { DataClassification = ToBeClassified; }
        field(50133; "Sector 2"; Code[20]) { DataClassification = ToBeClassified; }
        field(50134; "Sector 3"; Code[20]) { DataClassification = ToBeClassified; }
        field(50135; "Sector 4"; Code[20]) { DataClassification = ToBeClassified; }
        field(50136; "Sector 5"; Code[20]) { DataClassification = ToBeClassified; }
        field(50137; "Applicable Model (New)"; Code[20]) { DataClassification = ToBeClassified; }
        field(50138; "Items on Intrasit"; Code[20]) { DataClassification = ToBeClassified; }
        field(50139; "Old HS Codes"; Code[20]) { DataClassification = ToBeClassified; }
        field(50140; "Usage period (Warranty)"; DateFormula) { DataClassification = ToBeClassified; }
        field(50141; "hscode delete"; Code[20]) { DataClassification = ToBeClassified; }
        field(50142; "TransferReceipt Qty"; Decimal) { DataClassification = ToBeClassified; }
        field(50143; "Transfer Qty"; Decimal) { DataClassification = ToBeClassified; }
        field(50144; "Picture 3"; BLOB) { DataClassification = ToBeClassified; }
        field(50145; "Picture 2"; BLOB) { DataClassification = ToBeClassified; }
        field(50146; "Picture 4"; BLOB) { DataClassification = ToBeClassified; }
        field(50147; "Negative Adjustment"; Decimal) { DataClassification = ToBeClassified; }
        field(50148; "Item G/L Budget Account"; Code[20]) { DataClassification = ToBeClassified; }
        field(50149; "QA Code"; Code[20]) { DataClassification = ToBeClassified; }
        field(50150; "Status"; Option)
        {
            OptionMembers = "On Hold","Pending Approval",Approved;
        }
        field(50151; "Responsibility Center"; Code[20]) { DataClassification = ToBeClassified; }
        field(50152; "Currency Code"; Code[20]) { DataClassification = ToBeClassified; }
        field(50153; "Currency Factor"; Decimal) { DataClassification = ToBeClassified; }
        field(50154; "Rel. Exchange Rate"; Decimal) { DataClassification = ToBeClassified; }
        field(50155; "Add Custom duty"; Decimal) { DataClassification = ToBeClassified; }
        field(50156; "Gross Profit Target"; Decimal) { DataClassification = ToBeClassified; }
        field(50157; "Ex Factory Price"; Decimal) { DataClassification = ToBeClassified; }
        field(50158; "EX Factory Accessories"; Decimal) { DataClassification = ToBeClassified; }
        field(50159; "Add Ancillary Charges"; Decimal) { DataClassification = ToBeClassified; }
        field(50160; "Add Sea Freight"; Decimal) { DataClassification = ToBeClassified; }
        field(50161; "Add PDI Costs"; Decimal) { DataClassification = ToBeClassified; }
        field(50162; "Application Gross Profit Targe"; Decimal) { DataClassification = ToBeClassified; }
        field(50163; "Dealer Discount"; Decimal) { DataClassification = ToBeClassified; }
        field(50164; "Agent Commision"; Decimal) { DataClassification = ToBeClassified; }
        field(50165; "Dealer Price"; Decimal) { DataClassification = ToBeClassified; }
        field(50166; "Maximum Agent Commision"; Decimal) { DataClassification = ToBeClassified; }
        field(50167; "Cost Of Application Purchase"; Decimal) { DataClassification = ToBeClassified; }
        field(50168; "Maximum Dealer Commision"; Decimal) { DataClassification = ToBeClassified; }
        field(50169; "Track Image (Body)"; BLOB) { DataClassification = ToBeClassified; }
        field(50170; "Track-Image (No Body)"; BLOB) { DataClassification = ToBeClassified; }
        field(50171; "Transfer Ship  Qty"; Decimal) { DataClassification = ToBeClassified; }
        field(50172; "Average Price"; Decimal) { DataClassification = ToBeClassified; }
        field(50173; "Sales Commission"; Decimal) { DataClassification = ToBeClassified; }
        field(50174; "Assembly Cost"; Decimal) { DataClassification = ToBeClassified; }
        field(50175; "Total Gross Profit"; Decimal) { DataClassification = ToBeClassified; }
        field(50176; "Truck Seliing Price"; Decimal) { DataClassification = ToBeClassified; }
        field(50177; "Application Selling Price"; Decimal) { DataClassification = ToBeClassified; }
        field(50178; "Total Retail Price"; Decimal) { DataClassification = ToBeClassified; }
        field(50179; "ITEM LAST BUY"; Decimal) { DataClassification = ToBeClassified; }
        field(50180; "Insurance %"; Decimal) { DataClassification = ToBeClassified; }
        field(50181; "Margin  %"; Decimal) { DataClassification = ToBeClassified; }
        field(50182; "Max Retail Price"; Decimal) { DataClassification = ToBeClassified; }
        field(50183; "Min Retail Price"; Decimal) { DataClassification = ToBeClassified; }
        field(50184; "Supplier Name"; Code[20]) { DataClassification = ToBeClassified; }
        field(50185; "Size"; Code[20]) { DataClassification = ToBeClassified; }

    }
}
