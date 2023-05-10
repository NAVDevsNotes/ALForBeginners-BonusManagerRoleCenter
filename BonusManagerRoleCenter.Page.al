page 65501 "Bonus Manager Role Center"
{
    PageType = RoleCenter;

    layout
    {
        area(RoleCenter)
        {
            part(Headline; "Bonus Manager Headline")
            {
                ApplicationArea = All;
            }
            part("Bonuses Activities"; "Bonuses Activities")
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        area(Creation)
        {
            action(NewBonusCard)
            {
                ApplicationArea = All;
                RunObject = page "Bonus Card";
                RunPageMode = Create;
                ToolTip = 'Just a tooltip';
                Caption = 'Bonus Card';
            }
        }
        area(Reporting)
        {
            action(BonusOverview)
            {
                ApplicationArea = All;
                RunObject = report "Bonus Overview";
                ToolTip = 'Just a tooltip';
                Caption = 'Bonus Overview';
            }
        }
    }
}