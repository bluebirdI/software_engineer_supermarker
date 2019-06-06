classdef testmanager < matlab.uitest.TestCase
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
            testCase.login.RoleDropDownBox.Value = "����";
            testCase.login.AccountBox.Value = "liyaokun";
            testCase.login.PasswordBox.Value = "LyK2019@1997";
            testCase.verifyEqual(testCase.login.PasswordBox.Value,'LyK2019@1997');            
            testCase.press(testCase.login.LoginButton);
            

            testCase.choose(testCase.login.ManagerUI);
            %�۸�Ķ�
            testCase.press(testCase.login.ManagerChangePrice);
            testCase.login.ChangePriceUI.Name.Value = "milk";
            testCase.press(testCase.login.ChangePriceUI.Button); 
            testCase.login.ChangePriceUI.NewPrice.Value = 5;
            testCase.press(testCase.login.ChangePriceUI.ConfirmButton);
            testCase.press(testCase.login.ChangePriceUI.Button);
            testCase.press(testCase.login.ChangePriceUI.Button); 
            testCase.verifyEqual(testCase.login.ChangePriceUI.CurrentPrice.Value,5);
            testCase.press(testCase.login.ChangePriceUI.ExitButton); 
            testCase.addTeardown(@delete,testCase.login.ChangePriceUI);
            
            %������Ʒ AddCommodityUI1
            testCase.press(testCase.login.addCommodity);
            testCase.login.AddCommodityUI1.Name.Value = "duck";
            testCase.login.AddCommodityUI1.Inventory.Value = 100;
            testCase.login.AddCommodityUI1.Price.Value = 50;
            testCase.press(testCase.login.AddCommodityUI1.AddButton);
            testCase.press(testCase.login.AddCommodityUI1.ExitButton);
            testCase.addTeardown(@delete,testCase.login.AddCommodityUI1);
            
            %�޸Ŀ��
            testCase.press(testCase.login.ManagerChangeInventory);
            testCase.login.ChangeInventoryUI.Name.Value = "duck";
            testCase.press(testCase.login.ChangeInventoryUI.InquireButton); 
            testCase.login.ChangeInventoryUI.NewInventory.Value = 900;
            testCase.press(testCase.login.ChangeInventoryUI.ConfirmButton);
            testCase.press(testCase.login.ChangeInventoryUI.InquireButton);
            testCase.press(testCase.login.ChangeInventoryUI.InquireButton); 
            testCase.verifyEqual(testCase.login.ChangeInventoryUI.CurrentInventory.Value,900);
            testCase.press(testCase.login.ChangeInventoryUI.ExitButton);
            testCase.addTeardown(@delete,testCase.login.ChangeInventoryUI);
            
            %ɾ����Ʒ DeleteCommodityUI1
            testCase.press(testCase.login.deleteCommodity);
            testCase.login.DeleteCommodityUI1.Name.Value = "duck";
            testCase.press(testCase.login.DeleteCommodityUI1.DeleteButton);
            testCase.press(testCase.login.DeleteCommodityUI1.ExitButton);
            testCase.addTeardown(@delete,testCase.login.DeleteCommodityUI1);
            
            %�鿴����״�� SalesUI
            testCase.press(testCase.login.ManagerSales);
            testCase.login.SalesUI.StartDate.Value = datetime([2019 4 17]);
            testCase.login.SalesUI.EndDate.Value = datetime([2019 5 22]);
            testCase.login.SalesUI.DropDown.Value = 'ֱ��ͼ';
            testCase.press(testCase.login.SalesUI.InquireButton);            
            testCase.press(testCase.login.SalesUI.ExitButton);  
            testCase.addTeardown(@delete,testCase.login.SalesUI);
            
            testCase.addTeardown(@delete,testCase.login);
        end        
    end
end

    