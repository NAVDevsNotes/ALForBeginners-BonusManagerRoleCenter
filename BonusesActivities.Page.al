page 65500 "Bonuses Activities"
{
    PageType = CardPart;
    SourceTable = "Bonuses Cue";
    Caption = 'Bonuses Activities';

    layout
    {
        area(Content)
        {
            cuegroup(Bonuses)
            {
                Caption = 'Bonuses';
                field("Bonuses Qty. - Open"; rec."Open Bonuses Qty.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Just a tooltip';
                }
                field("Bonuses Qty. - Released"; rec."Released Bonuses Qty.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Just a tooltip';
                }
                field("Bonus Entries Amt."; rec."Bonus Entries Amt.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Just a tooltip';
                    DrillDownPageId = "Bonus Entries";
                }
                field("Customers With Bonuses"; rec."Customers with Bonuses")
                {
                    ApplicationArea = All;
                    ToolTip = 'Just a tooltip';
                    DrillDownPageId = "Customer List";
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.Get() then begin
            rec.Init();
            rec.Insert();
        end;
    end;

    trigger OnAfterGetRecord()
    begin
        rec."Bonus Entries Amt." := rec.CalcBonusEntriesAmount();
        rec."Customers with Bonuses" := rec.CalcCustomersWithBonuses();
    end;
}