import type { MetaFunction } from "@remix-run/node";
import { Link, json, useLoaderData } from "@remix-run/react";

export const meta: MetaFunction = () => {
  return [
    { title: "tango" },
    { name: "description", content: "tango" },
  ];
};

type Language = { id: number; name: string }

export const loader = async () => {
  const res = await fetch("http://localhost:3000/languages")
  return json<Language[]>(await res.json())
}

export default function Index() {
  const data = useLoaderData<typeof loader>();
  return (
    <div className="text-3xl typo font-bold">
      <ul>
        {data.map(({ id, name }) => <li key={id}><Link to={`/languages/${id}`}>{name}</Link></li>)}
      </ul>
    </div>
  );
}
