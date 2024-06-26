import { ApplicationConfig } from '@angular/core';
import { provideRouter } from '@angular/router';

import { routes } from './app.routes';
import {State} from "../services/state.service";

export const appConfig: ApplicationConfig = {
  providers: [provideRouter(routes), State]
};
