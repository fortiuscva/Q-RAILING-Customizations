pageextension 52100 "QRL Req. Worksheet" extends "Req. Worksheet"
{
    layout
    {
        addafter("Unit of Measure Code")
        {
            field("QRL Quantity On Hand"; Rec."QRL Quantity On Hand")
            {
                ApplicationArea = All;
                ToolTip = 'Specifices the Item Inventory';
            }
            field("QRL Qty. On Purch. Order"; Rec."QRL Qty. On Purch. Order")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Item Qty On Purchase Order';
            }
            field("QRL Qty. On Sales Order"; Rec."QRL Qty. On Sales Order")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Item Qty On Sales Order';
            }
            field("QRL ReOrderPoint"; ReOrderPoint)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the Item Reorder Point';
                Caption = 'ReOrder Point';
                DecimalPlaces = 0 : 5;
            }
            field("QRL ReOrderQty"; ReOrderQty)
            {
                ApplicationArea = All;
                ToolTip = 'Specifes the Item Rorder Qty';
                Caption = 'Reorder Qty';
                DecimalPlaces = 0 : 5;
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        clear(ItemRec);
        if ItemRec.Get(Rec."No.") then begin
            ReOrderPoint := ItemRec."Reorder Point";
            ReOrderQty := ItemRec."Reorder Quantity";
        end;

    end;

    var
        ReOrderQty: Decimal;
        ReOrderPoint: Decimal;
        ItemRec: Record Item;

}
