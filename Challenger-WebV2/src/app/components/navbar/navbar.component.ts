import { Component } from '@angular/core';
import { AdminService } from '../../services/admin.service';
import { Router } from '@angular/router';
import { UserDetailsResponse } from '../../models/user-details.interface';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrl: './navbar.component.css'
})
export class NavbarComponent {

  accountId!: string;
  admin! : UserDetailsResponse;

  constructor(private AdminService: AdminService, private route: Router){};

  ngOnInit(): void{
    this.accountId = localStorage.getItem('accountId') as string;
    if (this.accountId){
      this.AdminService.getLoggedAdmin().subscribe(resp => { this.admin = resp;})
    }
  }
}
