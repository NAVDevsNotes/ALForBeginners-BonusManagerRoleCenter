table 65500 "Bonuses Cue"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Primary Key';
        }
        field(2; "Open Bonuses Qty."; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Bonus Header" where(Status = filter(Open)));
            Caption = 'Bonuses - Open';
        }
        field(3; "Released Bonuses Qty."; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Bonus Header" where(Status = filter(Released)));
            Caption = 'Bonuses - Released';
        }
        field(4; "Bonus Entries Amt."; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Bonus Entries Amount';
        }
        field(5; "Customers with Bonuses"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Customers with Bonuses';
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
    procedure CalcBonusEntriesAmount() Amount: Decimal;
    var
        BonusEntriesAmtQuery: Query "Bonus Entries Amount";
    begin
        BonusEntriesAmtQuery.Open();
        if BonusEntriesAmtQuery.Read() then
            Amount := BonusEntriesAmtQuery.Bonus_Amount;
        BonusEntriesAmtQuery.Close();
    end;

    procedure CalcCustomersWithBonuses() CustomersQty: Integer;
    var
        CustomersWithBonusesQuery: Query "Customers With Bonuses";
    begin
        CustomersWithBonusesQuery.Open();
        if CustomersWithBonusesQuery.Read() then
            CustomersQty := CustomersWithBonusesQuery.Count1;
        CustomersWithBonusesQuery.Close();
    end;
}