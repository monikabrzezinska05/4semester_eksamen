import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppComponent } from './app.component';
import { ToastrModule } from 'ngx-toastr';
import {RouterModule, RouterOutlet} from "@angular/router";
import {OverviewComponent} from "./overview/overview.component";
import {LoginpageComponent} from "./loginpage/loginpage.component";
import {DashboardComponent} from "./dashboard/dashboard.component";
import {HistoryviewComponent} from "./historyview/historyview.component";
import {HistorypageComponent} from "./historypage/historypage.component";
import {SidebarComponent} from "./sidebar/sidebar.component";
import {ReactiveFormsModule} from "@angular/forms";
import {routes} from "./app.routes";
import {BrowserAnimationsModule} from "@angular/platform-browser/animations";

@NgModule({
  declarations: [
    AppComponent,
    OverviewComponent,
    LoginpageComponent,
    DashboardComponent,
    HistoryviewComponent,
    HistorypageComponent,
    SidebarComponent
  ],
  imports: [
    BrowserModule,
    ToastrModule.forRoot(),
    RouterModule.forRoot(routes),
    ReactiveFormsModule,
    BrowserAnimationsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
