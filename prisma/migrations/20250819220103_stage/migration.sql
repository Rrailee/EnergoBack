-- CreateEnum
CREATE TYPE "public"."Type" AS ENUM ('Products', 'Machines', 'Production');

-- CreateTable
CREATE TABLE "public"."Image" (
    "id" SERIAL NOT NULL,
    "type" "public"."Type" NOT NULL,
    "url" TEXT NOT NULL,

    CONSTRAINT "Image_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."Drawing" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "imageurl" TEXT NOT NULL,

    CONSTRAINT "Drawing_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."Execution" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "model3durl" TEXT NOT NULL,
    "certificate" TEXT NOT NULL,
    "imageurls" TEXT[],
    "drawingId" INTEGER NOT NULL,

    CONSTRAINT "Execution_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."ExecutionItem" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "mass" DOUBLE PRECISION NOT NULL,
    "price1" DOUBLE PRECISION NOT NULL,
    "price2" DOUBLE PRECISION NOT NULL,
    "executionId" INTEGER NOT NULL,

    CONSTRAINT "ExecutionItem_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Drawing_name_key" ON "public"."Drawing"("name");

-- CreateIndex
CREATE INDEX "ExecutionItem_executionId_name_idx" ON "public"."ExecutionItem"("executionId", "name");

-- AddForeignKey
ALTER TABLE "public"."Execution" ADD CONSTRAINT "Execution_drawingId_fkey" FOREIGN KEY ("drawingId") REFERENCES "public"."Drawing"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."ExecutionItem" ADD CONSTRAINT "ExecutionItem_executionId_fkey" FOREIGN KEY ("executionId") REFERENCES "public"."Execution"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
