import { NgModule } from '@angular/core';
import { BrowserModule, provideClientHydration } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginPageComponent } from './ui/login-page/login-page.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { UserProfilePageComponent } from './ui/user-profile-page/user-profile-page.component';
import { AdminSectionComponent } from './sections/admin-section/admin-section.component';
import { HttpClientModule, provideHttpClient, withFetch } from '@angular/common/http';
import { FormsModule } from '@angular/forms';
import { ClientPageComponent } from './ui/client-page/client-page.component';
import { NavbarComponent } from './components/navbar/navbar.component';

@NgModule({
  declarations: [
    AppComponent,
    LoginPageComponent,
    UserProfilePageComponent,
    AdminSectionComponent,
    ClientPageComponent,
    NavbarComponent,
    
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    NgbModule,
    HttpClientModule,
    FormsModule
  ],
  providers: [
    [provideHttpClient(withFetch())],
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
