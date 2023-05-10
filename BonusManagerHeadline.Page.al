page 65502 "Bonus Manager Headline"
{
    PageType = HeadlinePart;

    layout
    {
        area(Content)
        {
            group(General)
            {
                ShowCaption = false;
                field(Welcome; Welcome)
                {
                    ApplicationArea = All;
                }
                field(Awesome; Awesome)
                {
                    ApplicationArea = All;

                    trigger OnDrillDown()
                    begin
                        page.RunModal(page::"Bonus List")
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        BonusHeader: Record "Bonus Header";
    begin
        Welcome := StrSubstNo(WelcomeLbl, UserId());
        Awesome := StrSubstNo(BonusesCardQtyLbl, BonusHeader.Count())
    end;

    var
        WelcomeLbl: Label 'Welcome %1', Comment = '%1 is a user name';
        BonusesCardQtyLbl: Label '<qualifier>Bonuses Insights</qualifier><payload>You have <emphasize>%1</emphasize> bonus cards at the moment!</payload>', Comment = '%1 is a quantity of bonus cards.';
        Welcome: Text;
        Awesome: text;
}
