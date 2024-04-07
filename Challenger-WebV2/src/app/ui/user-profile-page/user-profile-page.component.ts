import { Component } from '@angular/core';
import { AdminService } from '../../services/admin.service';

@Component({
  selector: 'app-user-profile-page',
  templateUrl: './user-profile-page.component.html',
  styleUrl: './user-profile-page.component.css'
})
export class UserProfilePageComponent {

  oldPassword = '';
  newPassword = '';
  verifyPassword = '';

  constructor(private adminService: AdminService) {}

  changePassword() {
      if (this.newPassword === this.verifyPassword) {
        this.adminService.changePassword(this.oldPassword, this.newPassword, this.verifyPassword).subscribe(resp => {
        });
      } else {
        console.log('Passwords do not match');
    }
  }
}

