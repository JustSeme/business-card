import { Injectable, NotFoundException } from '@nestjs/common';
import {
  ProfileRepository,
  ProfileWithRelations,
} from './profile.repository.js';

@Injectable()
export class ProfileService {
  constructor(private readonly repository: ProfileRepository) {}

  async getProfile(): Promise<ProfileWithRelations> {
    const profile = await this.repository.findFirst();

    if (!profile) throw new NotFoundException();

    return profile;
  }
}
