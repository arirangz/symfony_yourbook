<?php

namespace App\Controller\Admin;

use App\Entity\Adherent;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class AdherentCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return Adherent::class;
    }

    /*
    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id'),
            TextField::new('title'),
            TextEditorField::new('description'),
        ];
    }
    */
}
