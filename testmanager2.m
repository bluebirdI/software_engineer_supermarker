classdef testmanager2 < matlab.uitest.TestCase
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
        function test_manager(testCase)
            testCase.login.RoleDropDownBox.Value = "经理";
            testCase.login.AccountBox.Value = "liyaokun";
            testCase.login.PasswordBox.Value = "LyK2019@1997";
            testCase.verifyEqual(testCase.login.PasswordBox.Value,'LyK2019@1997');            
            testCase.press(testCase.login.LoginButton);

            testCase.choose(testCase.login.ManagerUI);
            pause(1);
            %价格改动
            testCase.press(testCase.login.ManagerChangePrice);
            testCase.login.ChangePriceUI.Name.Value = "milk";
            testCase.press(testCase.login.ChangePriceUI.Button); 
            testCase.login.ChangePriceUI.NewPrice.Value = 5;
            pause(2);
            testCase.press(testCase.login.ChangePriceUI.ConfirmButton);
            testCase.press(testCase.login.ChangePriceUI.Button);
            testCase.press(testCase.login.ChangePriceUI.Button); 
            testCase.verifyEqual(testCase.login.ChangePriceUI.CurrentPrice.Value,5);
            pause(2);
            testCase.press(testCase.login.ChangePriceUI.ExitButton); 
           
            
            %增加商品 AddCommodityUI1
            testCase.press(testCase.login.addCommodity);
            testCase.login.AddCommodityUI1.Name.Value = "duck";
            testCase.login.AddCommodityUI1.Inventory.Value = 100;
            testCase.login.AddCommodityUI1.Price.Value = 50;
            testCase.press(testCase.login.AddCommodityUI1.AddButton);
             pause(2);
            testCase.press(testCase.login.AddCommodityUI1.ExitButton);
            
           
            %修改库存
            testCase.press(testCase.login.ManagerChangeInventory);
            testCase.login.ChangeInventoryUI.Name.Value = "duck";
            testCase.press(testCase.login.ChangeInventoryUI.InquireButton); 
            testCase.login.ChangeInventoryUI.NewInventory.Value = 900;
            testCase.press(testCase.login.ChangeInventoryUI.ConfirmButton);
            testCase.press(testCase.login.ChangeInventoryUI.InquireButton);
            testCase.press(testCase.login.ChangeInventoryUI.InquireButton); 
            testCase.verifyEqual(testCase.login.ChangeInventoryUI.CurrentInventory.Value,900);
            pause(2);
            testCase.press(testCase.login.ChangeInventoryUI.ExitButton);
            
           
            %删除商品 DeleteCommodityUI1
            testCase.press(testCase.login.deleteCommodity);
            testCase.login.DeleteCommodityUI1.Name.Value = "duck";
            testCase.press(testCase.login.DeleteCommodityUI1.DeleteButton);
            pause(2);
            testCase.press(testCase.login.DeleteCommodityUI1.ExitButton);
           
            
            %查看销售状况 SalesUI
            testCase.press(testCase.login.ManagerSales);
            testCase.login.SalesUI.StartDate.Value = datetime([2019 5 10]);
            testCase.login.SalesUI.EndDate.Value = datetime([2019 5 30]);
            testCase.login.SalesUI.DropDown.Value = '直方图';
            testCase.press(testCase.login.SalesUI.InquireButton);
            pause(8);
            testCase.login.SalesUI.DropDown.Value = '折线图';
            testCase.press(testCase.login.SalesUI.InquireButton);
            pause(5);
            testCase.press(testCase.login.SalesUI.ExitButton);  
            
             testCase.addTeardown(@delete,testCase.login.ChangePriceUI);
             testCase.addTeardown(@delete,testCase.login.AddCommodityUI1);
             testCase.addTeardown(@delete,testCase.login.ChangeInventoryUI);
              testCase.addTeardown(@delete,testCase.login.DeleteCommodityUI1);
            testCase.addTeardown(@delete,testCase.login.SalesUI);

            testCase.addTeardown(@delete,testCase.login);
        end
        

        function test_manager_wrong_pw(testCase)
            testCase.choose(testCase.login.ManagerUI);
            pause(1);
            testCase.choose(testCase.login.LoginUI);
            testCase.login.RoleDropDownBox.Value = "经理";
            testCase.login.AccountBox.Value = "liyaokun";
            testCase.login.PasswordBox.Value = "LyK2019@199";
            testCase.verifyEqual(testCase.login.PasswordBox.Value,'LyK2019@199');            
            testCase.press(testCase.login.LoginButton);
            pause(2);
            testCase.choose(testCase.login.ManagerUI);
            pause(1);
        end
        
        function test_manager_wrong_account(testCase)
            testCase.choose(testCase.login.ManagerUI);
            pause(1);
            testCase.choose(testCase.login.LoginUI);
            testCase.login.RoleDropDownBox.Value = "经理";
            testCase.login.AccountBox.Value = "liyaoku";
            testCase.login.PasswordBox.Value = "LyK2019@1997";
            testCase.verifyEqual(testCase.login.PasswordBox.Value,'LyK2019@1997');            
            testCase.press(testCase.login.LoginButton);
            pause(2);
            testCase.choose(testCase.login.ManagerUI);
            pause(1);
%             testCase.addTeardown(@delete,testCase.login);
        end
        
        function test_manager_wrong_change_price(testCase)
            testCase.login.RoleDropDownBox.Value = "经理";
            testCase.login.AccountBox.Value = "liyaokun";
            testCase.login.PasswordBox.Value = "LyK2019@1997";
            testCase.verifyEqual(testCase.login.PasswordBox.Value,'LyK2019@1997');            
            testCase.press(testCase.login.LoginButton);
%             delete(tesgCase.login.wdlg);
            testCase.choose(testCase.login.ManagerUI);
    
            %价格改动
            testCase.press(testCase.login.ManagerChangePrice);
            testCase.login.ChangePriceUI.Name.Value = "milk";
            testCase.press(testCase.login.ChangePriceUI.Button); 
            testCase.login.ChangePriceUI.NewPrice.Value = -5;
            pause(2);
            testCase.verifyEqual(testCase.login.ChangePriceUI.CurrentPrice.Value,5);
            testCase.press(testCase.login.ChangePriceUI.ConfirmButton);
            pause(2)
            testCase.press(testCase.login.ChangePriceUI.Button);
            pause(2);
            testCase.press(testCase.login.ChangePriceUI.ExitButton); 
%             testCase.addTeardown(@delete,testCase.login.ChangePriceUI);
%             testCase.addTeardown(@delete,testCase.login);
        end
        
        function test_manager_wrong_add_commodity(testCase)
            testCase.login.RoleDropDownBox.Value = "经理";
            testCase.login.AccountBox.Value = "liyaokun";
            testCase.login.PasswordBox.Value = "LyK2019@1997";
            testCase.verifyEqual(testCase.login.PasswordBox.Value,'LyK2019@1997');            
            testCase.press(testCase.login.LoginButton);
%             delete(tesgCase.login.wdlg);
            testCase.choose(testCase.login.ManagerUI);
            
            %增加商品 AddCommodityUI1
            testCase.press(testCase.login.addCommodity);
            testCase.login.AddCommodityUI1.Name.Value = "apple";
            testCase.login.AddCommodityUI1.Inventory.Value = 1000;
            testCase.login.AddCommodityUI1.Price.Value = 1;
            pause(2);
            testCase.press(testCase.login.AddCommodityUI1.AddButton);
            pause(2);
                       
            testCase.press(testCase.login.AddCommodityUI1.ExitButton);
            
        end

        function test_manager_wrong_change_inventory(testCase)
            testCase.login.RoleDropDownBox.Value = "经理";
            testCase.login.AccountBox.Value = "liyaokun";
            testCase.login.PasswordBox.Value = "LyK2019@1997";
            testCase.verifyEqual(testCase.login.PasswordBox.Value,'LyK2019@1997');            
            testCase.press(testCase.login.LoginButton);
%             delete(tesgCase.login.wdlg);
            testCase.choose(testCase.login.ManagerUI);
            %修改库存
            testCase.press(testCase.login.ManagerChangeInventory);
            testCase.login.ChangeInventoryUI.Name.Value = "apple1";
            testCase.press(testCase.login.ChangeInventoryUI.InquireButton); 
            pause(2);
            testCase.press(testCase.login.ChangeInventoryUI.ExitButton);
           
        end

        function test_manager_wrong_delete_commodity(testCase)
            testCase.login.RoleDropDownBox.Value = "经理";
            testCase.login.AccountBox.Value = "liyaokun";
            testCase.login.PasswordBox.Value = "LyK2019@1997";
            testCase.verifyEqual(testCase.login.PasswordBox.Value,'LyK2019@1997');            
            testCase.press(testCase.login.LoginButton);
%             delete(tesgCase.login.wdlg);
            testCase.choose(testCase.login.ManagerUI);
            %删除商品 DeleteCommodityUI1
            testCase.press(testCase.login.deleteCommodity);
            testCase.login.DeleteCommodityUI1.Name.Value = "apple1";
            testCase.press(testCase.login.DeleteCommodityUI1.DeleteButton);
            pause(1.5);
            testCase.press(testCase.login.DeleteCommodityUI1.ExitButton);
            
        end
        
        function test_manager_wrong_sales(testCase)
            testCase.login.RoleDropDownBox.Value = "经理";
            testCase.login.AccountBox.Value = "liyaokun";
            testCase.login.PasswordBox.Value = "LyK2019@1997";
            testCase.verifyEqual(testCase.login.PasswordBox.Value,'LyK2019@1997');            
            testCase.press(testCase.login.LoginButton);
%             delete(tesgCase.login.wdlg);
            testCase.choose(testCase.login.ManagerUI);
           
            %查看销售状况 SalesUI
            testCase.press(testCase.login.ManagerSales);
            testCase.login.SalesUI.StartDate.Value = datetime([2019 4 17]);
            testCase.login.SalesUI.EndDate.Value = datetime([2019 7 1]);
            testCase.login.SalesUI.DropDown.Value = '折线图';
            testCase.press(testCase.login.SalesUI.InquireButton);
            pause(10);
            testCase.press(testCase.login.SalesUI.ExitButton);  
%             testCase.addTeardown(@delete,testCase.login.SalesUI);
%             
%             testCase.addTeardown(@delete,testCase.login);
        end        
%         
        
    end
end

    