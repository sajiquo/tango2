import type { LoaderFunctionArgs, MetaFunction } from "@remix-run/node";
import { json, useLoaderData } from "@remix-run/react";
import invariant from "tiny-invariant";

import { QuizSuite } from "~/features/quizSuite"

export const meta: MetaFunction = () => {
  return [
    { title: "tango" },
    { name: "description", content: "tango" },
  ];
};

type Quiz = { text: string; options: string[], answer: string }

export const loader = async ({ params }: LoaderFunctionArgs) => {
  invariant(params.lessonId)
  const res = await fetch(`http://localhost:3000/lessons/${params.lessonId}/quiz`)
  return json<Quiz[]>(await res.json())
}

export default function Lesson() {
  const data = useLoaderData<typeof loader>();
  return (
    <QuizSuite quizList={data} />
  );
}
