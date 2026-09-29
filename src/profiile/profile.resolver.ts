import { Query, Resolver } from '@nestjs/graphql';
import { ProfileModel } from './profile.model.js';
import { ProfileService } from './profile.service.js';
import { ProfileWithRelations } from './profile.repository.js';

@Resolver(() => ProfileModel)
export class ProfileResolver {
  constructor(private readonly profileService: ProfileService) {}

  @Query(() => ProfileModel, { name: 'profile' })
  profile(): Promise<ProfileWithRelations> {
    return this.profileService.getProfile();
  }
}
