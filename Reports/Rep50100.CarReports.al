report 50106 "Car Report"
{
    ApplicationArea = All;
    Caption = 'Car Reports';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = 'Reports\CarReports.rdlc';
    
    dataset
    {
        dataitem(CarBrand; CarBrand)
        {
            column(BrandNo; "BrandNo")
            {
                
            }
            column(Name; Name)
            {
                
            }
            column(CountryOfOrigin; CountryOfOrigin)
            {
               
            }
            column(Status; Status)
            {
                
            }
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
}
