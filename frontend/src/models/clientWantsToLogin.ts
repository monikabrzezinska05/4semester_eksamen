import {BaseDto} from "./BaseDto";

export class ClientWantsToLogin extends BaseDto<ClientWantsToLogin>{
  Email?: string;
  Password?: string;
}
