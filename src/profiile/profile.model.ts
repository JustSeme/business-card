import { Field, ObjectType } from '@nestjs/graphql';

@ObjectType('ProfileLink')
export class ProfileLinkModel {
  @Field()
  label: string;

  @Field()
  url: string;
}

@ObjectType('Skill')
export class SkillModel {
  @Field()
  name: string;
}

@ObjectType('Experience')
export class ExperienceModel {
  @Field()
  company: string;

  @Field()
  position: string;

  @Field(() => Date)
  startDate: Date;

  @Field(() => Date, { nullable: true })
  endDate?: Date | null;

  @Field(() => [String])
  achievements: string[];
}

@ObjectType('Project')
export class ProjectModel {
  @Field()
  title: string;

  @Field(() => String, { nullable: true })
  url?: string | null;
}

@ObjectType('Profile')
export class ProfileModel {
  @Field()
  name: string;

  @Field(() => String, { nullable: true })
  summary?: string | null;

  @Field(() => [ProfileLinkModel])
  links: ProfileLinkModel[];

  @Field(() => [SkillModel])
  skills: SkillModel[];

  @Field(() => [ExperienceModel])
  experiences: ExperienceModel[];

  @Field(() => [ProjectModel])
  projects: ProjectModel[];
}
