import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginPageComponent } from './ui/login-page/login-page.component';
import { ClientPageComponent } from './ui/client-page/client-page.component';
import { UserProfilePageComponent } from './ui/user-profile-page/user-profile-page.component';
import { UsersListPageComponent } from './ui/users-list-page/users-list-page.component';
import { SectionComponent } from './section/section.component';

const routes: Routes = [

  { path: 'login', component: LoginPageComponent },

  { path: 'admin', component: SectionComponent, children: [
    { path: 'me', component: UserProfilePageComponent},
    { path: 'client-user', component: ClientPageComponent},
    { path: 'users', component: UsersListPageComponent}
  ]},

  { path: '', redirectTo: '/login', pathMatch: 'full' },
  { path: '**', component: LoginPageComponent },
 
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
