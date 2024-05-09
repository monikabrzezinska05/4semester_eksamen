import { Routes } from '@angular/router';
import {DashboardComponent} from "./dashboard/dashboard.component";
import {LoginpageComponent} from "./loginpage/loginpage.component";


export const routes: Routes = [
  { path: '', component: DashboardComponent },
  { path: "/login", component: LoginpageComponent },
];
