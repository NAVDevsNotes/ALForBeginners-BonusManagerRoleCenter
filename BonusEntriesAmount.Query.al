query 65500 "Bonus Entries Amount"
{
    QueryType = Normal;

    elements
    {
        dataitem(BonusEntries; "Bonus Entry")
        {
            column(Bonus_Amount; "Bonus Amount")
            {
                Method = Sum;
            }
        }
    }
}