import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { HttpClientModule, provideHttpClient, withFetch } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { NavbarComponent } from './components/navbar/navbar.component';
import { LoginPageComponent } from './ui/login-page/login-page.component';
import { AdminSectionComponent } from './sections/admin-section/admin-section.component';
import { ClientPageComponent } from './ui/client-page/client-page.component';
import { UserProfilePageComponent } from './ui/user-profile-page/user-profile-page.component';

@NgModule({
  declarations: [
    AppComponent,
    NavbarComponent,
    AdminSectionComponent,
    ClientPageComponent,
    LoginPageComponent,
    UserProfilePageComponent, 
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
