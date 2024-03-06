import { LightningElement } from 'lwc';

export default class LWC_lookupComponentParent extends LightningElement {
    parentAccountSelectedRecord;
    handleValueSelectedOnAccount(event) {
        this.parentAccountSelectedRecord = event.detail;
    }
}