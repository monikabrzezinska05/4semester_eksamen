import {BaseDto} from "./BaseDto";

export class ServerAuthenticatesUser extends BaseDto<ServerAuthenticatesUser> {
    jwt?: string;
}
