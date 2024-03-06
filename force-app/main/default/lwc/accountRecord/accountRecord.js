// AccountListWithCases.js
import { LightningElement, api, wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';
import getRelatedCases from '@salesforce/apex/CaseController.getRelatedCases';

const columns = [
    { label: 'Case Number', fieldName: 'CaseNumber' },
    { label: 'Subject', fieldName: 'Subject' },
    { label: 'Status', fieldName: 'Status' }
];

export default class AccountListWithCases extends LightningElement {
    accounts;
    columns = columns;
    selectedAccountId;
    relatedCases;

    @wire(getAccounts)
    wiredAccounts({ data, error }) {
        if (data) {
            this.accounts = data;
        } else if (error) {
            console.error('Error fetching accounts', error);
        }
    }

    handleRadioChange(event) {
        this.selectedAccountId = event.target.value;
    }

    handleShowCases() {
        if (this.selectedAccountId) {
            // Fetch and display related cases
            getRelatedCases({ accountId: this.selectedAccountId })
                .then((data) => {
                    // Handle the data and display related cases
                    this.relatedCases = data;
                })
                .catch((error) => {
                    console.error('Error fetching related cases', error);
                });
        }
    }
}
