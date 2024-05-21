import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginPageComponent } from './ui/login-page/login-page.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { ClientPageComponent } from './ui/client-page/client-page.component';
import { UserProfilePageComponent } from './ui/user-profile-page/user-profile-page.component';
import { NavbarComponent } from './components/navbar/navbar.component';
import { UsersListPageComponent } from './ui/users-list-page/users-list-page.component';
import { SectionComponent } from './section/section.component';

@NgModule({
  declarations: [
    AppComponent,
    LoginPageComponent,
    ClientPageComponent,
    UserProfilePageComponent,
    NavbarComponent,
    UsersListPageComponent,
    SectionComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    NgbModule,
    HttpClientModule,
    FormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
