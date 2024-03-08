tableextension 52100 "QRL Requisition Line" extends "Requisition Line"
{
    fields
    {
        field(52100; "QRL Quantity On Hand"; Decimal)
        {
            Caption = 'Quantity On Hand';
            CalcFormula = sum("Item Ledger Entry".Quantity where("Item No." = field("No."),
                                                                               "Location Code" = field("Location Code")));
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(52101; "QRL Qty. On Purch. Order"; Decimal)
        {
            CalcFormula = sum("Purchase Line"."Outstanding Qty. (Base)" where("Document Type" = const(Order),
                                                                               Type = const(Item),
                                                                               "No." = field("No."),
                                                                               "Location Code" = field("Location Code")));
            Caption = 'Qty. on Purch. Order';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(52102; "QRL Qty. On Sales Order"; Decimal)
        {
            Caption = 'Qty. On Sales Order';
            CalcFormula = sum("Sales Line"."Outstanding Qty. (Base)" where("Document Type" = const(Order),
                                                                            Type = const(Item),
                                                                            "No." = field("No."),
                                                                            "Location Code" = field("Location Code")));
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
    }
}
