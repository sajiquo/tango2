
import type { LoaderFunctionArgs, MetaFunction } from "@remix-run/node";
import { Link, json, useLoaderData } from "@remix-run/react";
import invariant from "tiny-invariant";

export const meta: MetaFunction = () => {
  return [
    { title: "tango" },
    { name: "description", content: "tango" },
  ];
};

type Lesson = { id: number; name: string, }
type Language = { id: number; name: string, lessons: Lesson[] }

export const loader = async ({ params }: LoaderFunctionArgs) => {
  invariant(params.languageId)
  const res = await fetch(`http://localhost:3000/languages/${params.languageId}`)
  return json<Language>(await res.json())
}

export default function Language() {
  const data = useLoaderData<typeof loader>();
  return (
    <div className="text-3xl typo font-bold">
      <ul>
        {data.lessons.map(({ id, name }) =>
          <li key={id}>
            <Link to={`/lessons/${id}`}>{name}</Link>
          </li>
        )}
      </ul>
    </div>
  );
}
