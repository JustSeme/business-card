import { Module } from '@nestjs/common';
import { GraphQLModule } from '@nestjs/graphql';
import { PrismaModule } from './prisma/prisma.module.js';
import { ApolloDriver, ApolloDriverConfig } from '@nestjs/apollo';
import { ProfileModule } from './profiile/profile.module.js';
import { ConfigModule } from '@nestjs/config';

@Module({
  imports: [
    GraphQLModule.forRoot<ApolloDriverConfig>({
      driver: ApolloDriver,
      autoSchemaFile: true,
      playground: true,
      introspection: true,
    }),
    ConfigModule.forRoot({
      isGlobal: true,
    }),
    PrismaModule,
    ProfileModule,
  ],
})
export class AppModule {}
