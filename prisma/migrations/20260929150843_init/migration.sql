-- CreateTable
CREATE TABLE "profiles" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "summary" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "profiles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "profile_links" (
    "id" SERIAL NOT NULL,
    "profile_id" INTEGER NOT NULL,
    "label" TEXT NOT NULL,
    "url" TEXT NOT NULL,

    CONSTRAINT "profile_links_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "skills" (
    "id" SERIAL NOT NULL,
    "profile_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "skills_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "experiences" (
    "id" SERIAL NOT NULL,
    "profile_id" INTEGER NOT NULL,
    "company" TEXT NOT NULL,
    "position" TEXT NOT NULL,
    "start_date" DATE NOT NULL,
    "end_date" DATE,
    "achievements" TEXT[] DEFAULT ARRAY[]::TEXT[],

    CONSTRAINT "experiences_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "projects" (
    "id" SERIAL NOT NULL,
    "profile_id" INTEGER NOT NULL,
    "title" TEXT NOT NULL,
    "url" TEXT,

    CONSTRAINT "projects_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "skills_profile_id_name_key" ON "skills"("profile_id", "name");

-- CreateIndex
CREATE INDEX "experiences_profile_id_start_date_idx" ON "experiences"("profile_id", "start_date");

-- CreateIndex
CREATE INDEX "projects_profile_id_idx" ON "projects"("profile_id");

-- AddForeignKey
ALTER TABLE "profile_links" ADD CONSTRAINT "profile_links_profile_id_fkey" FOREIGN KEY ("profile_id") REFERENCES "profiles"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "skills" ADD CONSTRAINT "skills_profile_id_fkey" FOREIGN KEY ("profile_id") REFERENCES "profiles"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "experiences" ADD CONSTRAINT "experiences_profile_id_fkey" FOREIGN KEY ("profile_id") REFERENCES "profiles"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "projects" ADD CONSTRAINT "projects_profile_id_fkey" FOREIGN KEY ("profile_id") REFERENCES "profiles"("id") ON DELETE CASCADE ON UPDATE CASCADE;
