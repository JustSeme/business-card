import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service.js';
import { Prisma } from '../../generated/prisma/client.js';

const profileInclude = {
  links: { orderBy: { id: 'asc' } },
  skills: { orderBy: { id: 'asc' } },
  projects: { orderBy: { id: 'asc' } },
  experiences: { orderBy: { startDate: 'desc' } },
} satisfies Prisma.ProfileInclude;

export type ProfileWithRelations = Prisma.ProfileGetPayload<{
  include: typeof profileInclude;
}>;

@Injectable()
export class ProfileRepository {
  constructor(private readonly prisma: PrismaService) {}

  findFirst(): Promise<ProfileWithRelations | null> {
    return this.prisma.profile.findFirst({
      orderBy: { id: 'asc' },
      include: profileInclude,
    });
  }
}
