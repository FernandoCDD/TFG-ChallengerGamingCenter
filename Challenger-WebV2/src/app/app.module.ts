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
import { UserRowComponent } from './components/user-row/user-row/user-row.component';
import { UserListComponent } from './components/user-list/user-list.component';
import { ReservasPageComponent } from './ui/reservas-page/reservas-page.component';
import { ReservasRowComponent } from './components/reservas-row/reservas-row.component';
import { ReservasListComponent } from './components/reservas-list/reservas-list.component';
import { ProductosRowComponent } from './components/productos-row/productos-row.component';
import { ProductosListComponent } from './components/productos-list/productos-list.component';
import { ProductosPageComponent } from './ui/productos-page/productos-page.component';
import { CategoriaRowComponent } from './components/categoria-row/categoria-row.component';
import { CategoriaListComponent } from './components/categoria-list/categoria-list.component';
import { CategoriasPageComponent } from './ui/categorias-page/categorias-page.component';
import { PedidosPageComponent } from './ui/pedidos-page/pedidos-page.component';

@NgModule({
  declarations: [
    AppComponent,
    LoginPageComponent,
    ClientPageComponent,
    UserProfilePageComponent,
    NavbarComponent,
    UsersListPageComponent,
    SectionComponent,
    UserRowComponent,
    UserListComponent,
    ReservasPageComponent,
    ReservasRowComponent,
    ReservasListComponent,
    ProductosRowComponent,
    ProductosListComponent,
    ProductosPageComponent,
    CategoriaRowComponent,
    CategoriaListComponent,
    CategoriasPageComponent,
    PedidosPageComponent,
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
