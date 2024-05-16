import {BaseDto} from "./BaseDto";

export class ClientWantsToLogin extends BaseDto<ClientWantsToLogin>{
  email?: string;
  password?: string;
}
