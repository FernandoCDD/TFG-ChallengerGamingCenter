import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AdminSectionComponent } from './sections/admin-section/admin-section.component';
import { UserProfilePageComponent } from './ui/user-profile-page/user-profile-page.component';
import { LoginPageComponent } from './ui/login-page/login-page.component';
import { ClientPageComponent } from './ui/client-page/client-page.component';

const routes: Routes = [

  { path: 'login', component: LoginPageComponent },

  {
    path: 'admin', component: AdminSectionComponent, children: [
      {path: 'me', component: UserProfilePageComponent}
    ]
  },
 
  { path: 'client-user', component: ClientPageComponent},
  { path: '', redirectTo: '/login', pathMatch: 'full'},
  { path: '**', component: LoginPageComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
