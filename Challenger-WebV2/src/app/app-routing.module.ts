import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginPageComponent } from './ui/login-page/login-page.component';
import { ClientPageComponent } from './ui/client-page/client-page.component';
import { UserProfilePageComponent } from './ui/user-profile-page/user-profile-page.component';
import { UsersListPageComponent } from './ui/users-list-page/users-list-page.component';
import { SectionComponent } from './section/section.component';
import { ReservasPageComponent } from './ui/reservas-page/reservas-page.component';
import { ProductosPageComponent } from './ui/productos-page/productos-page.component';
import { CategoriasPageComponent } from './ui/categorias-page/categorias-page.component';
import { PedidosPageComponent } from './ui/pedidos-page/pedidos-page.component';

const routes: Routes = [

  { path: 'login', component: LoginPageComponent },

  { path: 'admin', component: SectionComponent, children: [
    { path: 'me', component: UserProfilePageComponent},
    { path: 'client-user', component: ClientPageComponent},
    { path: 'users', component: UsersListPageComponent},
    { path: 'reservas', component: ReservasPageComponent},
    { path: 'productos', component: ProductosPageComponent},
    { path: 'categorias', component: CategoriasPageComponent},
    { path: 'pedidos', component: PedidosPageComponent}
  ]},

  { path: '', redirectTo: '/login', pathMatch: 'full' },
  { path: '**', component: LoginPageComponent },
 
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
