import { LightningElement, track } from 'lwc';
import getRelatedAccounts from '@salesforce/apex/lookupAccountController.getRelatedAccounts';
const columns = [
    { label: 'Account Name', fieldName: 'Name' },
    { label: 'Industry', fieldName: 'Industry' },
    { label: 'Phone', fieldName: 'Phone' }
];
export default class DemoLookupAccountDetails extends LightningElement {
    columns = columns;
    selectedAccountId;
    @track accountsData;
    

    handleValueSelectedOnAccount(event){

        if(!event.detail.selectedRecord) {
            return;
        }
        

        this.selectedAccountId = event.detail.selectedRecord.Id;
        if (this.selectedAccountId) {
            console.log("here");
            // Fetch and display related Accounts
            getRelatedAccounts({ accountId: this.selectedAccountId })
                .then((data) => {
                    // Handle the data and display related Accounts
                    this.accountsData = data;
                    console.log(data);
                })
                .catch((error) => {
                    console.error('Error fetching related Accounts', error);
                });
        }
    }
}