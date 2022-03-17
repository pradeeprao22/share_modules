import { Controller } from 'stimulus';
import consumer from '../channels/consumer';

export default class extends Controller {
   static targets = ['input', 'posts'];

   connect() {
     this.channel = consumer.subscriptions.create('PostChannel', {
       connected: this._cableConneted.bind(this),
       disconnected: this._cableDisconneted.bind(this),
       received: this._cableReceived.bind(this),
     });
   }

   clearInput() {
     this.InputTarget.value = '';
   }

   _cableConneted() {

   }

   _cableDisconneted() {

   }

   _cableReceived(data){
    this.postsTarget.innerHTML += data.post;
   }
}
