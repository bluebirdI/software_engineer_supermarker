sclassdef testcashier < matlab.uitest.TestCase
	properties
    	login
    end

    methods (TestMethodSetup)
        function launchApp(testCase)
            testCase.login = Login;
            testCase.addTeardown(@delete,testCase.login);
        end
    end
    
    methods(Test)


        function test_cashier(testCase)
            testCase.login.RoleDropDownBox.Value = "收银员";
            testCase.login.AccountBox.Value = "liyaokun";
            testCase.login.PasswordBox.Value = "LyK2019@1997";
            testCase.verifyEqual(testCase.login.PasswordBox.Value,'LyK2019@1997');   
            pause(2);
            testCase.press(testCase.login.LoginButton);
            pause(2);
            testCase.choose(testCase.login.CashierUI);
            %查看商品信息 InquireCommodityUI
            testCase.press(testCase.login.CashierInquireCommodity);
            testCase.login.InquireCommodityUI.Name.Value = "milk";
            pause(2);
            testCase.press(testCase.login.InquireCommodityUI.InquireButton);
            pause(2);
            testCase.verifyEqual(testCase.login.InquireCommodityUI.CurrentPrice.Value,5);
            testCase.press(testCase.login.InquireCommodityUI.ExitButton);
            
            pause(0.5);
            %结账 CashierCheckOutUI  app.UITable.Data
            testCase.press(testCase.login.CashierCheckOut);
            
            testCase.login.CashierCheckOutUI.Name.Value = "milk";
            testCase.login.CashierCheckOutUI.Number.Value = 1;
            testCase.press(testCase.login.CashierCheckOutUI.AddCommodity);
            pause(2);
            testCase.login.CashierCheckOutUI.Pay.Value = 10;
            testCase.verifyEqual(testCase.login.CashierCheckOutUI.TotalPrice.Value,5);
            testCase.press(testCase.login.CashierCheckOutUI.ChangeButton);
            testCase.verifyEqual(testCase.login.CashierCheckOutUI.Change.Value,5);
            testCase.press(testCase.login.CashierCheckOutUI.ConformButton);
            pause(2);
            testCase.press(testCase.login.CashierCheckOutUI.ExitButton);
            testCase.addTeardown(@delete,testCase.login);
        end
 
        function test_cashier_checktout(testCase)
            testCase.login.RoleDropDownBox.Value = "收银员";
            testCase.login.AccountBox.Value = "liyaokun";
            testCase.login.PasswordBox.Value = "LyK2019@1997";
            testCase.verifyEqual(testCase.login.PasswordBox.Value,'LyK2019@1997');   
            testCase.press(testCase.login.LoginButton);
            testCase.choose(testCase.login.CashierUI);
            %查看商品信息 InquireCommodityUI
            pause(2);
            %结账 CashierCheckOutUI  app.UITable.Data
            testCase.press(testCase.login.CashierCheckOut);
            
            testCase.login.CashierCheckOutUI.Name.Value = "milk";
            testCase.login.CashierCheckOutUI.Number.Value = 1;
            testCase.press(testCase.login.CashierCheckOutUI.AddCommodity);
            pause(1);
            testCase.login.CashierCheckOutUI.Name.Value = "milk";
            testCase.login.CashierCheckOutUI.Number.Value = 1;
            testCase.press(testCase.login.CashierCheckOutUI.AddCommodity);
            pause(2);
            testCase.login.CashierCheckOutUI.Name.Value = "apple";
            testCase.login.CashierCheckOutUI.Number.Value = 3;
            testCase.press(testCase.login.CashierCheckOutUI.AddCommodity)
            pause(1);
            testCase.login.CashierCheckOutUI.Name.Value = "banana";
            testCase.login.CashierCheckOutUI.Number.Value = 3;
            testCase.press(testCase.login.CashierCheckOutUI.AddCommodity)
            pause(1);
            testCase.login.CashierCheckOutUI.Name.Value = "orange";
            testCase.login.CashierCheckOutUI.Number.Value = 3;
            testCase.press(testCase.login.CashierCheckOutUI.AddCommodity)
            pause(1);
            
            
            testCase.login.CashierCheckOutUI.Pay.Value = 100;
            testCase.verifyEqual(testCase.login.CashierCheckOutUI.TotalPrice.Value,19);
            testCase.press(testCase.login.CashierCheckOutUI.ChangeButton);
            testCase.verifyEqual(testCase.login.CashierCheckOutUI.Change.Value,81);
            testCase.press(testCase.login.CashierCheckOutUI.ConformButton);
            pause(2);
            testCase.press(testCase.login.CashierCheckOutUI.ExitButton);
            testCase.addTeardown(@delete,testCase.login);
        end
        
        function test_cashier_wrong_inquire_commodity(testCase)
            testCase.login.RoleDropDownBox.Value = "收银员";
            testCase.login.AccountBox.Value = "liyaokun";
            testCase.login.PasswordBox.Value = "LyK2019@1997";
            testCase.verifyEqual(testCase.login.PasswordBox.Value,'LyK2019@1997');   
            pause(2);
            testCase.press(testCase.login.LoginButton);
            pause(2);
            testCase.choose(testCase.login.CashierUI);
            %查看商品信息 InquireCommodityUI
            testCase.press(testCase.login.CashierInquireCommodity);
            testCase.login.InquireCommodityUI.Name.Value = "apple1";
            pause(2);
            testCase.press(testCase.login.InquireCommodityUI.InquireButton);
            pause(2);
            testCase.verifyEqual(testCase.login.InquireCommodityUI.CurrentPrice.Value,0);
            testCase.press(testCase.login.InquireCommodityUI.ExitButton);
            
        end        
        
 
        function test_cashier_checktout_not_enough_money(testCase)
            testCase.login.RoleDropDownBox.Value = "收银员";
            testCase.login.AccountBox.Value = "liyaokun";
            testCase.login.PasswordBox.Value = "LyK2019@1997";
            testCase.verifyEqual(testCase.login.PasswordBox.Value,'LyK2019@1997');   
            testCase.press(testCase.login.LoginButton);
            testCase.choose(testCase.login.CashierUI);
            %查看商品信息 InquireCommodityUI
            pause(2);
            %结账 CashierCheckOutUI  app.UITable.Data
            testCase.press(testCase.login.CashierCheckOut);
            
            testCase.login.CashierCheckOutUI.Name.Value = "computer";
            testCase.login.CashierCheckOutUI.Number.Value = 50;
            testCase.press(testCase.login.CashierCheckOutUI.AddCommodity);
            pause(2);

            testCase.login.CashierCheckOutUI.Pay.Value = 100;
            testCase.verifyEqual(testCase.login.CashierCheckOutUI.TotalPrice.Value,50000);
            testCase.press(testCase.login.CashierCheckOutUI.ChangeButton);
            testCase.verifyEqual(testCase.login.CashierCheckOutUI.Change.Value,-49900);
            testCase.press(testCase.login.CashierCheckOutUI.ConformButton);
            pause(2);
            testCase.press(testCase.login.CashierCheckOutUI.ExitButton);
        end   
        
        function test_cashier_checktout_enough_money(testCase)
%             testCase.choose(testCase.login.LoginUI);
%             testCase.login.RoleDropDownBox.Value = "经理";
%             testCase.login.AccountBox.Value = "liyaokun";
%             testCase.login.PasswordBox.Value = "LyK2019@1997";
%             testCase.press(testCase.login.LoginButton);
%             pause(2);
%             
%             testCase.choose(testCase.login.ManagerUI);
%             %查看销售状况 SalesUI
%             testCase.press(testCase.login.ManagerSales);
%             testCase.login.SalesUI.StartDate.Value = datetime([2019 5 10]);
%             testCase.login.SalesUI.EndDate.Value = datetime([2019 5 30]);
%             testCase.login.SalesUI.DropDown.Value = '折线图';
%             testCase.press(testCase.login.SalesUI.InquireButton);            
%             pause(10);
%             testCase.press(testCase.login.SalesUI.ExitButton); 
            testCase.login.RoleDropDownBox.Value = "收银员";
            testCase.login.AccountBox.Value = "liyaokun";
            testCase.login.PasswordBox.Value = "LyK2019@1997";
            testCase.verifyEqual(testCase.login.PasswordBox.Value,'LyK2019@1997');   
            testCase.press(testCase.login.LoginButton);
            testCase.choose(testCase.login.CashierUI);
            %查看商品信息 InquireCommodityUI
            pause(2);
            %结账 CashierCheckOutUI  app.UITable.Data
            testCase.press(testCase.login.CashierCheckOut);
            
            testCase.login.CashierCheckOutUI.Name.Value = "computer";
            testCase.login.CashierCheckOutUI.Number.Value = 50;
            testCase.press(testCase.login.CashierCheckOutUI.AddCommodity);
            pause(2);

            testCase.login.CashierCheckOutUI.Pay.Value = 100000;
            testCase.verifyEqual(testCase.login.CashierCheckOutUI.TotalPrice.Value,50000);
            testCase.press(testCase.login.CashierCheckOutUI.ConformButton);
            pause(2);
            testCase.press(testCase.login.CashierCheckOutUI.ExitButton);
            testCase.choose(testCase.login.LoginUI);
            testCase.login.RoleDropDownBox.Value = "经理";
            testCase.login.AccountBox.Value = "liyaokun";
            testCase.login.PasswordBox.Value = "LyK2019@1997";
            testCase.press(testCase.login.LoginButton);
            pause(2);
            
            testCase.choose(testCase.login.ManagerUI);
            %查看销售状况 SalesUI
            testCase.press(testCase.login.ManagerSales);
            testCase.login.SalesUI.StartDate.Value = datetime([2019 5 10]);
            testCase.login.SalesUI.EndDate.Value = datetime([2019 5 30]);
            testCase.login.SalesUI.DropDown.Value = '折线图';
            testCase.press(testCase.login.SalesUI.InquireButton);            
            pause(10);
            testCase.press(testCase.login.SalesUI.ExitButton);  
        end          
        
    end
end
